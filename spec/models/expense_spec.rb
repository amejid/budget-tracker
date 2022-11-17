require 'rails_helper'

RSpec.describe Expense, type: :model do
  before(:example) do
    @user = User.create(name: 'Amejid', email: 'test@gmail.com', password: '123456')
    @category = Category.new(author: @user, name: 'Travel', icon: 'https://cdn-icons-png.flaticon.com/512/3075/3075977.png')
  end

  context 'Validations' do
    it 'checks for name presence' do
      expense = Expense.new(author: @user, amount: 123, category_ids: [@category.id])
      expect(expense.valid?).to eq false
    end

    it 'checks for amount presence' do
      expense = Expense.new(author: @user, name: 'Nice One', category_ids: [@category.id])
      expect(expense.valid?).to eq false
    end

    it 'checks for name and amount presence' do
      expense = Expense.new(author: @user, name: 'Nice One', amount: 745, category_ids: [@category.id])
      expect(expense.valid?).to eq true
    end
  end

  context 'Associations' do
    it 'belongs to an author' do
      expense = Expense.reflect_on_association('author')
      expect(expense.macro).to eq(:belongs_to)
    end

    it 'has many categories' do
      expense = Expense.reflect_on_association('categories')
      expect(expense.macro).to eq(:has_many)
    end
  end
end
