class ChangeDefaultForAlertStatus < ActiveRecord::Migration[5.2]
  def change
    change_column :alerts, :status, :boolean, default: false
  end
end
