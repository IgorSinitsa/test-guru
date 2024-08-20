class Test < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: :User
  belongs_to :category
  has_many :results
  has_many :users, through: :results
  has_many :questions
  validates :title, presence: true

  validates :level, presence: true,
                    numericality: { only_integer: true },
                    uniqueness: { scope: :title }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY.to_i) }
  scope :level, ->(level) { where(tests: { level: level }) }
  scope :category_of, ->(name) {
          joins(:category).where(categories: { title: name })
        }
  # правильно понял об использования scope?

  def self.category_order_desc(category)
    category_of(category).order(title: :desc)
  end
end
