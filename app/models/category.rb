class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_expenses, dependent: :destroy
  has_many :expenses, through: :category_expenses

  validates :name, presence: true
  validates :icon, presence: true
end
