class Cart < ApplicationRecord
  belongs_to :production
  belongs_to :user
  include Authority::Abilities
  self.authorizer_name = 'AdminAuthorizer'

end
