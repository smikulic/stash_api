# frozen_string_literal: true

# Defines bank account model
class BankAccount < ApplicationRecord
  validates_presence_of :user_id, :name, :status, :balance, :currency
  belongs_to :user
end
