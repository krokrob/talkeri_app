class AddAlertSolverIdToMessages < ActiveRecord::Migration[5.2]
  def change
    add_reference :messages, :alert_solver, foreign_key: true
  end
end
