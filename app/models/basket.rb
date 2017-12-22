class Basket < ApplicationRecord
  include Authority::Abilities
  self.authorizer_name = 'AdminAuthorizer'
  belongs_to :production
  belongs_to :user
end
