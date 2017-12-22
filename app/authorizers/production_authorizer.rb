class ProductionAuthorizer < ApplicationAuthorizer
  def self.readable_by?(user)
      user.role?
  end

  def self.creatable_by?(user)
    user && !user.role?
  end

  def self.deletable_by?(user)
    user && !user.role?
  end

end
