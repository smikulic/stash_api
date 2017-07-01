# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Api::SettingsController, type: :controller do
  let(:invalid_attributes) do
    { user_id: 'nil',
      average_monthly_incomes: 2700,
      average_monthly_expenses: 1800,
      main_currency: 'EUR' }
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

  describe 'GET #show' do
    it 'assigns the requested setting as @setting' do
      mocked_setting = Setting.new(user_id: @mocked_user.id,
                                   average_monthly_incomes: 2700,
                                   average_monthly_expenses: 1800,
                                   main_currency: 'EUR')
      mocked_setting.save

      get :show,
          params: {
            user_id: @mocked_user.id,
            id: mocked_setting.id
          },
          format: :json

      request_result = assigns(:setting)
      expect(response.status).to eql 200
      expect(request_result).to include(mocked_setting)

      mocked_setting.destroy
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Setting' do
        setting_mock = {
          user_id: @mocked_user.id,
          average_monthly_incomes: 2700,
          average_monthly_expenses: 1800,
          main_currency: 'EUR'
        }

        post :create, params: setting_mock, format: :json

        request_result = assigns(:setting)

        expect(response.status).to eql 201
        expect(request_result.user_id).to eq @mocked_user.id.to_s
        expect(request_result.main_currency).to eq setting_mock[:main_currency]
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
      it 'updates the requested setting' do
        mocked_setting = Setting.new(user_id: @mocked_user.id,
                                     average_monthly_incomes: 2700,
                                     average_monthly_expenses: 1800,
                                     main_currency: 'EUR')
        mocked_setting.save

        updated_setting_mock = {
          id: mocked_setting.id,
          user_id: @mocked_user.id,
          average_monthly_incomes: 3700,
          average_monthly_expenses: 1800,
          main_currency: 'EUR'
        }
        mocked_setting = Setting.new(user_id: @mocked_user.id,
                                     average_monthly_incomes: 2700,
                                     average_monthly_expenses: 1800,
                                     main_currency: 'EUR')

        put :update, params: updated_setting_mock, format: :json

        expect(response.status).to eql 202

        mocked_setting.destroy
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested setting' do
      mocked_setting = Setting.new(user_id: @mocked_user.id,
                                   average_monthly_incomes: 2700,
                                   average_monthly_expenses: 1800,
                                   main_currency: 'EUR')
      mocked_setting.save

      delete :destroy,
             params: {
               user_id: @mocked_user.id,
               id: mocked_setting.id
             },
             format: :json

      expect(response.status).to eq(204)

      mocked_setting.destroy
    end
  end
end
