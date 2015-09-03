class AddEstimatedResolutionTimeToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :estimated_resolution_time, :string
  end
end
