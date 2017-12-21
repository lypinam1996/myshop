class Production < ApplicationRecord
  belongs_to :author
  has_many :carts, dependent: :destroy
  validates :title,  presence: true, uniqueness: true
  has_many :histories, dependent: :destroy
end
