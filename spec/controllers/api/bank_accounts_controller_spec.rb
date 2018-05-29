# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::BankAccountsController, type: :controller do
  let(:invalid_attributes) do
    { user_id: 'nil',
      name: 'Wells fargo',
      status: 'primary',
      currency: 'USD',
      balance: 12000 }
  end

  before(:each) do
    @mocked_user = User.new(email: 'admin@name.com',
                            password: 'password',
                            password_confirmation: 'password')
    @mocked_user.skip_confirmation!
    @mocked_user.save
  end

  after(:each) do
    @mocked_user.destroy
  end

  describe 'GET #index' do
    it 'assigns all bank_accounts as @bank_accounts' do
      mocked_bank_account = BankAccount.new(user_id: @mocked_user.id,
                                          name: 'Wells Fargo',
                                          status: 'primary',
                                          currency: 'USD',
                                          balance: 12000)
      mocked_bank_account.save

      get :index, params: { user_id: @mocked_user.id }, format: :json

      request_result = assigns(:bank_accounts)
      expect(response.status).to eql 200
      expect(request_result).to include(mocked_bank_account)

      mocked_bank_account.destroy
    end
  end

  describe 'GET #show' do
    it 'assigns the requested bank_account as @bank_account' do
      mocked_bank_account = BankAccount.new(user_id: @mocked_user.id,
                                          name: 'Wells Fargo',
                                          status: 'primary',
                                          currency: 'USD',
                                          balance: 12000)
      mocked_bank_account.save

      get :show,
          params: {
            user_id: @mocked_user.id,
            id: mocked_bank_account.id
          },
          format: :json

      request_result = assigns(:bank_account)
      expect(response.status).to eql 200
      expect(request_result).to include(mocked_bank_account)

      mocked_bank_account.destroy
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new BankAccount' do
        bank_account_mock = {
          user_id: @mocked_user.id,
          name: 'Wells Fargo',
          status: 'primary',
          currency: 'USD',
          balance: 12000
        }

        post :create, params: bank_account_mock, format: :json

        request_result = assigns(:bank_account)

        expect(response.status).to eql 201
        expect(request_result.user_id).to eq @mocked_user.id.to_s
        expect(request_result.balance).to eq bank_account_mock[:balance]
      end
    end

    context 'with invalid params' do
      it 'returns unprocessable_entity status' do
        post :create, params: invalid_attributes, format: :json
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested bank_account' do
        mocked_bank_account = BankAccount.new(user_id: @mocked_user.id,
                                          name: 'Wells Fargo',
                                          status: 'primary',
                                          currency: 'USD',
                                          balance: 12000)
        mocked_bank_account.save

        updated_bank_account_mock = {
          id: mocked_bank_account.id,
          user_id: @mocked_user.id,
          name: 'Wells Fargo',
          status: 'primary',
          currency: 'USD',
          balance: 12000
        }

        put :update, params: updated_bank_account_mock, format: :json

        expect(response.status).to eql 202

        mocked_bank_account.destroy
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested bank_account' do
      mocked_bank_account = BankAccount.new(user_id: @mocked_user.id,
                                          name: 'Wells Fargo',
                                          status: 'primary',
                                          currency: 'USD',
                                          balance: 12000)
      mocked_bank_account.save

      delete :destroy,
             params: {
               user_id: @mocked_user.id,
               id: mocked_bank_account.id
             },
             format: :json

      expect(response.status).to eq(204)

      mocked_bank_account.destroy
    end
  end
end
