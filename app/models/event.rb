class Event < ApplicationRecord
  has_many :reservations
  belongs_to :user

  validates :name, presence: true
  validates :date, presence: true
  validates :location, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
