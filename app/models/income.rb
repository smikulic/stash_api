# frozen_string_literal: true
# Defines income model
class Income < ApplicationRecord
  validates_presence_of :user_id, :value, :currency, :entry_date
end
