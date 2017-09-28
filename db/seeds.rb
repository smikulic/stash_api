# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command
# (or created alongside the database with db:setup).
#
# Examples:
#
#  movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#  Character.create(name: 'Luke', movie: movies.first)

[
  { user_id: '1', description: 'Random Goal 1', deadline: DateTime.now + 12.month, value: 240000},
  { user_id: '1', description: 'Random Goal 2', deadline: DateTime.now + 10.month, value: 20000},
  { user_id: '2', description: 'Test Goal 1', deadline: DateTime.now + 12.month, value: 140000},
  { user_id: '2', description: 'Test Goal 2', deadline: DateTime.now + 10.month, value: 10000},
].each do |saving_goal_attributes|
  SavingGoal.create(saving_goal_attributes)
end

[
  { user_id: '1', average_monthly_incomes: 2700, average_monthly_expenses: 1800, main_currency: 'EUR'},
  { user_id: '2', average_monthly_incomes: 3000, average_monthly_expenses: 1800, main_currency: 'USD'},
].each do |setting_attributes|
  Setting.create(setting_attributes)
end
