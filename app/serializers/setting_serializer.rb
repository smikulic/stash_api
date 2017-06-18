# frozen_string_literal: true
# Defines setting serializer
class SettingSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :average_monthly_incomes, :average_monthly_expenses, :main_currency
end
