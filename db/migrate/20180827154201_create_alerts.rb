class CreateAlerts < ActiveRecord::Migration[5.2]
  def change
    create_table :alerts do |t|
      t.references :user, foreign_key: true
      t.references :chatroom, foreign_key: true
      t.text :content
      t.boolean :status
      t.timestamps
    end
  end
end
