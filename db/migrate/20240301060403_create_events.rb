class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :host
      t.string :location
      t.date :date
      t.text :details
      t.boolean :private, default: false

      t.timestamps
    end
  end
end
