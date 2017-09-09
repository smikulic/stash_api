# frozen_string_literal: true
module Api
  # Defines saving goals controller
  class SavingGoalsController < ApplicationController

    swagger_controller :saving_goals, "User Management"

    def self.add_common_params(api)
      api.param :form, "user[name]", :string, :optional, "Name"
      api.param :form, "user[email]", :string, :optional, "Email"
    end

    swagger_api :index do
      summary "Fetches all User items"
      notes "This lists all the active users"
    end

    #before_action :authenticate_user!
    before_action :set_saving_goal, only: [:show, :update, :destroy]

    def index
      @saving_goals = User.find(params[:user_id]).saving_goals
      render json: @saving_goals, status: :ok
    end

    def show
      render json: @saving_goal
    end

    def create
      @saving_goal = SavingGoal.new(saving_goal_params)

      if @saving_goal.save
        render json: @saving_goal, status: :created
      else
        render json: @saving_goal.errors, status: :unprocessable_entity
      end
    end

    def update
      if @saving_goal.update(saving_goal_params)
        render json: @saving_goal, status: :accepted
      else
        render json: @saving_goal.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @saving_goal.destroy(params[:id])
      head :no_content
    end

    private

    def set_saving_goal
      @saving_goal = SavingGoal.where(
        user_id: params[:user_id],
        id: params[:id]
      )
    end

    def saving_goal_params
      params.permit(
        :id,
        :user_id,
        :description,
        :deadline,
        :value
      )
    end
  end
end
