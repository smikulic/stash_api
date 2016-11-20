# frozen_string_literal: true
# Defines income serializer
class IncomeSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :category, :value, :currency, :entry_date
end
