class AddServiceIdToTickets < ActiveRecord::Migration
  def change
    add_reference :tickets, :service, index: true
    add_foreign_key :tickets, :services
  end
end
