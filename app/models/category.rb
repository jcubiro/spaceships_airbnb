class Category < ApplicationRecord
  has_and_belongs_to_many :ships

  validates :name, presence: true, uniqueness: true
end
