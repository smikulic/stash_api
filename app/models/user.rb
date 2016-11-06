class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  after_create :send_confirmation_email, if: -> { User.devise_modules.include?(:confirmable) }

  private
  def send_confirmation_email
    self.send_confirmation_instructions
  end
end
