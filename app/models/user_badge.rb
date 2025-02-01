class UserBadge < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :badge

end
