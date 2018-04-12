# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SavingGoal, type: :model do
  subject do
    described_class.new(
      user_id: '123abc',
      description: 'Saving goal',
      deadline: Time.now + 3.month,
      value: 24_000
    )
  end

  it 'is not valid without a user_id' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a deadline' do
    subject.deadline = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a value' do
    subject.value = nil
    expect(subject).to_not be_valid
  end
end
