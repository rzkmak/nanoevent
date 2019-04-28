class PurchaseController < ApplicationController
  def create
    purchase_data = purchase_params
    first_data = purchase_data[:tickets].shift
    first_ticket = Ticket.find(first_data[:ticket_id])
    first_data[:quota] = first_ticket.quota

    purchase_data[:tickets].each do |item|
      temp_ticket = Ticket.find(item[:ticket_id])
      item[:quota] = temp_ticket.quota
      if first_ticket[:event_id] != temp_ticket[:event_id]
        render_errors('Transaction Error': 'Purchase should be in one event')
        return
      end
    end

    purchase_data[:tickets].push(first_data)

    purchase_data[:tickets].each do |item|
      if item[:amount].to_i > item[:quota].to_i
        render_errors('Transaction Error': 'Some ticket already sold')
        return
      end
    end

    purchase_result_id = nil

    ActiveRecord::Base.transaction do
      purchase_base = Purchase.new
      purchase_base.customer_id = purchase_data[:customer_id]
      purchase_base.save
      purchase_result_id = purchase_base.id
      purchase_data[:tickets].each do |item|
        temp_purchase_ticket = PurchaseTicket.new
        temp_purchase_ticket.ticket_id = item[:ticket_id]
        temp_purchase_ticket.amount = item[:amount]
        temp_purchase_ticket.purchase_id = purchase_base.id
        temp_purchase_ticket.save

        update_ticket_qty = Ticket.find(item[:ticket_id])
        update_ticket_qty.quota = update_ticket_qty.quota - temp_purchase_ticket.amount
        update_ticket_qty.save
      end
    end

    purchase_result = Purchase.includes(:purchase_tickets).find(purchase_result_id)

    render json: purchase_result, status: :created

    rescue ActiveRecord::RecordInvalid
      render_errors('Transaction Error': 'Invalid transaction')
  end

  private

  def purchase_params
    params.require(:purchase).permit(:customer_id, tickets: %i[ticket_id amount])
  end
end
