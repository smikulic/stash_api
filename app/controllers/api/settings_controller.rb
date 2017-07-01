# frozen_string_literal: true
module Api
  # Defines settings controller
  class SettingsController < ApplicationController
    # before_action :authenticate_user!
    before_action :set_setting, only: [:show, :update, :destroy]

    def show
      render json: @setting
    end

    def create
      @setting = Setting.new(setting_params)

      if @setting.save
        render json: @setting, status: :created
      else
        render json: @setting.errors, status: :unprocessable_entity
      end
    end

    def update
      if @setting.update(setting_params)
        render json: @setting, status: :accepted
      else
        render json: @setting.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @setting.destroy(params[:id])
      head :no_content
    end

    private

    def set_setting
      @setting = Setting.where(
        user_id: params[:user_id],
        id: params[:id]
      )
    end

    def setting_params
      params.permit(
        :id,
        :user_id,
        :average_monthly_incomes,
        :average_monthly_expenses,
        :main_currency
      )
    end
  end
end
