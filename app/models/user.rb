# frozen_string_literal: true

# Defines user model
class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_many :saving_goals, dependent: :destroy
  has_many :bank_accounts, dependent: :destroy
  has_many :settings, dependent: :destroy
end
