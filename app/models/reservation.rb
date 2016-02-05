class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  def formatted_time
     self.time.strftime("%A, %m/%d at %I:%M %p")
   end

  #  validates :party_size, presence: true, numericality: {only_integer: true, greater_than: 2}
   validates :time, presence: true
   
end
