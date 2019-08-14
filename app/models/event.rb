class Event < ApplicationRecord
  has_many :reservations
  belongs_to :user

  validates :name, presence: true
  validates :date, presence: true
  validates :location, presence: true
  mount_uploader :photo, PhotoUploader
end
