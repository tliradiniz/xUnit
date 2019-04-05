class NewTable < ActiveRecord::Migration[5.2]
  def change
    create_table :abducted_users do |t|
      t.integer :id_user
      t.integer :id_target
      t.timestamps
    end
  end
end
