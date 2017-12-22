class Author < ApplicationRecord
  include Authority::Abilities
  has_many :productions, dependent: :destroy
  validates :fullname,  presence: true, uniqueness: true
end
