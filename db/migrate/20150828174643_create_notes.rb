class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :note
      t.references :user, index: true
      t.references :ticket, index: true

      t.timestamps null: false
    end
    add_foreign_key :notes, :users
    add_foreign_key :notes, :tickets
  end
end
