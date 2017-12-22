class History < ApplicationRecord
  include Authority::Abilities
  self.authorizer_name = 'AdminAuthorizer'
  belongs_to :production
  belongs_to :user

  after_save :reculculate_count
    private
    def reculculate_count
      production.count =production.count-count
      production.save!
    end
end
