class Reservation < ActiveRecord::Base

  belongs_to :user
  belongs_to :restaurant

  def formatted_time
    self.time.strftime("%A, %m/%d at %I:%M %p")
  end

end
