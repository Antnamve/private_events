class User < ApplicationRecord
  has_person_name
  has_one_attached :avatar

  has_one :created_event, foreign_key: 'creator_id', class_name: 'Event'
  has_and_belongs_to_many :attended_events, class_name: 'Event'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
