class AddTechIdToTicket < ActiveRecord::Migration
  def change
    add_reference :tickets, :tech, index: true
    add_foreign_key :tickets, :teches
  end
end
