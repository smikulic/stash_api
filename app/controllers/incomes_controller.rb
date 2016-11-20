# frozen_string_literal: true
# Defines incomes controller
class IncomesController < ApplicationController
  before_action :set_income, only: [:show, :update, :destroy]

  def index
    @incomes = Income.all
    render json: @incomes
  end

  def show
    render json: @income
  end

  def create
    @income = Income.new(income_params)

    if @income.save
      render json: @income, status: :created, location: @income
    else
      render json: @income.errors, status: :unprocessable_entity
    end
  end

  def update
    if @income.update(income_params)
      head :no_content
    else
      render json: @income.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @income.destroy
    head :no_content
  end

  private

  def set_income
    @income = Income.find(params[:id])
  end

  def income_params
    params.require(:income).permit(:user_id, :title, :category, :value,
                                   :currency, :entry_date)
  end
end
