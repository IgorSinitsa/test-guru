class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  validates :name, presence: true
  validates :img, presence: true
  validates :code, presence: true

  scope :for_code, ->(code) { where(code: code) }
  scope :for_text, ->(text) { where(text: text) }

  def self.code_jobs
    select(:code).group("code").pluck(:code)
  end

  def self.for_code_text(code, text)
    for_code(code).for_text(text)
  end
end
