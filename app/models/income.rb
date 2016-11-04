class Income < ApplicationRecord
  validates_presence_of :user_id
  validates_presence_of :value
  validates_presence_of :currency
  validates_presence_of :entry_date
end
