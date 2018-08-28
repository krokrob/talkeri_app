class AlertSolver < ApplicationRecord
  belongs_to :user
  belongs_to :alert

  private

  # def update_alert_status
  #   self.alert.update(status: true)
  # end

end
