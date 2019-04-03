class Addfieldstodb < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :last_location
      t.integer :missing_count, default: 0
      t.string :status, default: "alive"

      t.timestamps
    end
  end
end
