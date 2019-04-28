class PurchaseController < ApplicationController
  def create
    purchase_data = purchase_params

    first_ticket = Ticket.find(purchase_data[:tickets][0][:ticket_id])

    transaction = true

    purchase_data[:tickets].each do |item|
      temp_ticket = Ticket.find(item[:ticket_id])
      if first_ticket[:event_id] != temp_ticket[:event_id]
        transaction = false
        break
      end
    end

    render_errors('Transaction Error': 'Purchase should be in one event') unless transaction
  end

  private

  def purchase_params
    params.require(:purchase).permit(:customer_id, tickets: %i[ticket_id amount])
  end
end
