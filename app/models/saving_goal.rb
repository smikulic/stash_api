# frozen_string_literal: true

# Defines saving goal model
class SavingGoal < ApplicationRecord
  validates_presence_of :user_id, :description, :deadline, :value
  belongs_to :user
end
