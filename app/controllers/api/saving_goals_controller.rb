# frozen_string_literal: true
module Api
  # Defines saving goals controller
  class SavingGoalsController < ApplicationController
    before_action :set_saving_goal, only: [:show, :update, :destroy]

    def aha
      render json: { aha: 'aha' }
    end

    def index
      @saving_goals = User.find(params[:user_id]).saving_goals
      render json: @saving_goals
    end

    def show
      @saving_goal = @saving_goal
      render json: @saving_goal
    end

    def create
      @saving_goal = SavingGoal.new(saving_goal_params)

      if @saving_goal.save
        render json: @saving_goal, status: :created, location: @saving_goal
      else
        render json: @saving_goal.errors, status: :unprocessable_entity
      end
    end

    def update
      if @saving_goal.update(saving_goal_params)
        head :no_content
      else
        render json: @saving_goal.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @saving_goal.destroy
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
      params.require(:saving_goal).permit(
        :user_id,
        :description,
        :deadline,
        :value
      )
    end
  end
end
