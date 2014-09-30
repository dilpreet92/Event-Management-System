class Event < ActiveRecord::Base
  belongs_to :user
  has_many :sessions
  validates :name, :address, :city, :country, :contact_details, :description, presence: true
  validates :description, length: { maximum: 500 }
end
