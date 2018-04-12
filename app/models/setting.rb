# frozen_string_literal: true

# Defines setting model
class Setting < ApplicationRecord
  validates_presence_of :user_id,
                        :average_monthly_incomes,
                        :average_monthly_expenses,
                        :main_currency

  belongs_to :user
end
