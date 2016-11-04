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
  end

  def update
  end

  def destroy
  end

  private

  def set_income
    @income = Income.find(params[:id])
  end
end
