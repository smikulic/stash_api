# frozen_string_literal: true

module Api
  # Defines saving goals controller
  class BankAccountsController < ApplicationController
    # before_action :authenticate_user!
    before_action :set_bank_account, only: %i[show update destroy]

    def index
      @bank_accounts = User.find(params[:user_id]).bank_accounts
      render json: @bank_accounts
    end

    def show
      render json: @bank_account
    end

    def create
      @bank_account = BankAccount.new(bank_account_params)

      if @bank_account.save
        render json: @bank_account, status: :created
      else
        render json: @bank_account.errors, status: :unprocessable_entity
      end
    end

    def update
      if @bank_account.update(bank_account_params)
        render json: @bank_account, status: :accepted
      else
        render json: @bank_account.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @bank_account.destroy(params[:id])
      head :no_content
    end

    private

    def set_bank_account
      @bank_account = BankAccount.where(
        user_id: params[:user_id],
        id: params[:id]
      )
    end

    def bank_account_params
      params.permit(
        :id,
        :user_id,
        :name,
        :status,
        :balance,
        :currency,
        :description
      )
    end
  end
end
