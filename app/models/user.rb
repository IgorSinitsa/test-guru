class Question < ApplicationRecord
  validates name, password, presence: true
end
