require 'rails_helper'

RSpec.describe User, type: :model do

  describe "db structure" do
    #it { is_expected.to have_db_column(:email).of_type(:string) }
    #it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    #it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe "validations" do
    it "is not valid without email" do
      user = User.new(email: nil)
      expect(user).to_not be_valid
    end
  end

end
