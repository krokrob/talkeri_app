class CreateAlertSolvers < ActiveRecord::Migration[5.2]
  def change
    create_table :alert_solvers do |t|
      t.references :user, foreign_key: true
      t.references :alert, foreign_key: true
      t.timestamps
    end
  end
end
