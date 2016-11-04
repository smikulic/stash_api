require 'rails_helper'

RSpec.describe Income, type: :model do
  subject {
    described_class.new(
      user_id: '123abc',
      title: 'Random Bank AG',
      category: 'Salary',
      value: 240000,
      currency: 'EUR',
      entry_date: DateTime.now - 1.week
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a user_id" do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a value" do
    subject.value = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a currency" do
    subject.currency = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a entry_date" do
    subject.entry_date = nil
    expect(subject).to_not be_valid
  end
end
