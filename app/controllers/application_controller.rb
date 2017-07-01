# frozen_string_literal: true
# Defines application controller
class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  rescue_from ActiveRecord::RecordNotFound,       with: :not_found
  rescue_from ActionController::ParameterMissing, with: :missing_param_error

  Swagger::Docs::Generator::set_real_methods
  include Swagger::Docs::ImpotentMethods

  def not_found
    render status: :not_found, json: ''
  end

  def missing_param_error(exception)
    render status: :unprocessable_entity, json: { error: exception.message }
  end

end
