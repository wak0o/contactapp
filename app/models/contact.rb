class Contact < ApplicationRecord
  has_many :tags, dependent: :destroy

  validates :name, presence: true
  validates :phone_number, presence: true
end
