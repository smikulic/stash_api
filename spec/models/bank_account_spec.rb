# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BankAccount, type: :model do
  subject do
    described_class.new(
      user_id: '123abc',
      name: 'Wells Fargo',
      status: 'primary',
      balance: 120_000,
      currency: 'USD',
      description: 'US account'
    )
  end

  it 'is not valid without a user_id' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a status' do
    subject.status = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a balance' do
    subject.balance = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a currency' do
    subject.currency = nil
    expect(subject).to_not be_valid
  end
end
