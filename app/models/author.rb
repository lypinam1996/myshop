class Author < ApplicationRecord
  has_many :productions, dependent: :destroy
  validates :fullname,  presence: true, uniqueness: true
end
