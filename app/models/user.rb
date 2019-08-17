class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :reservations
  has_many :reserved_events, :through => :reservations, :source => :event

  has_many :messages
  has_many :commented_events, :through => :messages, :source => :event

  has_many :interests
  has_many :interested_events, :through => :interests, :source => :event

  has_many :events #host

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  mount_uploader :photo, PhotoUploader
end
