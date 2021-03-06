class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :users, through: :reservations
  has_many :reviews
  has_many :users, through: :reviews

  def available?(party_size,time)
     available_capacity = capacity - reservations.where('time >= ? and time < ?', time.beginning_of_hour, time.end_of_hour).sum(:party_size)
     party_size > 0 && party_size <= available_capacity

  end







end
