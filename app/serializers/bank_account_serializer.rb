# frozen_string_literal: true

# Defines setting serializer
class BankAccountSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name, :status, :balance, :currency,
             :description, :updated_at
end
