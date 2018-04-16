# frozen_string_literal: true

# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  # Defines admin controller
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin

    def authenticate_admin
      # TODO: Add authentication logic here.
      authenticate_or_request_with_http_basic('Administration') do |user, pass|
        md5_of_pass = Digest::MD5.hexdigest(pass)
        user == 'mozerica' && md5_of_pass == '2211b2a3d870ae66968ca3f8ac0b5138'
      end
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
