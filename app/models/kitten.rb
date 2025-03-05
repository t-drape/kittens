class Kitten < ApplicationRecord
  validates :name, presence: true, length: {in: 4..10}
  validates :age, presence: true, comparison: { greater_than: 0 }
  validates :cuteness, presence: true, comparison: { greater_than: 0, less_than_or_equal_to: 10 }
  validates :softness, presence: true, comparison: { greater_than: 0, less_than_or_equal_to: 10 }
end
