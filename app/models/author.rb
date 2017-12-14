class Author < ApplicationRecord
  has_many :productions, dependent: :destroy
end
