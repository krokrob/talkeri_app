class AlertSolver < ApplicationRecord
  belongs_to :user
  belongs_to :alert
  after_create :update_alert_status, on: :create

  private

  def update_alert_status(alert_solver)
    alert_solver.alert.status = true
  end

end
