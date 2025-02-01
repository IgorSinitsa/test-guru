class Badge < ApplicationRecord
  belongs_to :user
  has_many :user_badges, dependent: :destroy
  validates :name, presence: true
  validates :img, presence: true
  validates :code, presence: true

  scope :code_group, -> { select(:code).group("code") }
  scope :badges_for_code, ->(code) { where(code: code) }

  def self.code_jobs
    code_group.pluck(:code)
  end
end
