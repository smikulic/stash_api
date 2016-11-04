# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


[
  { user_id: '123abc', title: 'Random Bank AG', category: 'Salary', value: '240000', currency: 'EUR', entry_date: DateTime.now - 1.week },
  { user_id: '123abc', title: 'Knows Bank AG', category: 'Salary', value: '170000', currency: 'EUR', entry_date: DateTime.now - 1.week },
  { user_id: '123abc', title: 'Family', category: 'Gift', value: '500', currency: 'USD', entry_date: DateTime.now - 4.week },
  { user_id: '123abc', title: 'Home router', category: 'Sale', value: '80', currency: 'EUR', entry_date: DateTime.now },
  { user_id: '123abc', value: '10', currency: 'EUR', entry_date: DateTime.now }
].each do |income_attributes|
  Income.create(income_attributes)
end
