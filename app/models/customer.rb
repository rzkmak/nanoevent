class Customer < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 30 }
end
