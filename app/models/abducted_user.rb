class AbductedUser < ApplicationRecord

  validates :id_user, presence: true
  validates :id_target, presence: true

end
