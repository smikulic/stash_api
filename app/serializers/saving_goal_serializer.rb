# frozen_string_literal: true

# Defines setting serializer
class SavingGoalSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :description, :deadline, :value, :created_at
end
