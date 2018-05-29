# frozen_string_literal: true

# Defines saving goal model
class BankAccount < ApplicationRecord
  validates_presence_of :user_id, :name, :status, :balance, :currency
  belongs_to :user

  # A) Everyone may set attributes
  # B) Only certain values are allowed
  attribute :status do
    %w(primary secondary)
  end
end
