class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true , uniqueness: true


  has_many :reservations
  has_many :restaurants, through: :reservations
  has_many :reviews
  has_many :restaurants, through: :reviews
end
