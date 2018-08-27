class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true
      t.references :chatroom, foreign_key: true
      t.text :content
      t.string :photo
      t.string :audio

      t.timestamps
    end
  end
end
