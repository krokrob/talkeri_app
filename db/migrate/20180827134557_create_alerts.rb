class CreateAlerts < ActiveRecord::Migration[5.2]
  def change
    create_table :alerts do |t|
      t.references :chatroom, foreign_key: true
      t.text :content
      t.references :creator
      t.references :solver
      t.timestamps
    end
    add_foreign_key :alerts, :users, column: :creator_id, primary_key: :id
    add_foreign_key :alerts, :users, column: :solver_id, primary_key: :id
  end
end
