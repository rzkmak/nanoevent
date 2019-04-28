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
  end

  private

  def purchase_params
    params.require(:purchase).permit(:customer_id, tickets: %i[ticket_id amount])
  end
end
