class Production < ApplicationRecord
  belongs_to :author
  has_many :baskets, dependent: :destroy
end
