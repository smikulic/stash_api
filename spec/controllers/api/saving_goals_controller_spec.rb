# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Api::SavingGoalsController, type: :controller do
  let(:invalid_attributes) do
    { user_id: 'nil',
      description: 'Random Goal 1',
      deadline: 'Sun, 06 Nov 2016 12:04:10 +0100',
      value: 2700 }
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
    it 'assigns all saving_goals as @saving_goals' do
      mocked_saving_goal = SavingGoal.new(user_id: @mocked_user.id,
                                          description: 'goal description',
                                          deadline: '2099-01-01',
                                          value: 2700)
      mocked_saving_goal.save

      get :index, params: { user_id: @mocked_user.id }, format: :json

      request_result = assigns(:saving_goals)
      expect(response.status).to eql 200
      expect(request_result).to include(mocked_saving_goal)

      mocked_saving_goal.destroy
    end
  end

  describe 'GET #show' do
    it 'assigns the requested saving_goal as @saving_goal' do
      mocked_saving_goal = SavingGoal.new(user_id: @mocked_user.id,
                                          description: 'goal description',
                                          deadline: '2099-01-01',
                                          value: 2700)
      mocked_saving_goal.save

      get :show,
          params: {
            user_id: @mocked_user.id,
            id: mocked_saving_goal.id
          },
          format: :json

      request_result = assigns(:saving_goal)
      expect(response.status).to eql 200
      expect(request_result).to include(mocked_saving_goal)

      mocked_saving_goal.destroy
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new SavingGoal' do
        saving_goal_mock = {
          user_id: @mocked_user.id,
          description: 'Random Goal 1',
          deadline: 'Sun, 06 Nov 2018 12:04:10 +0100',
          value: 2700
        }

        post :create, params: saving_goal_mock, format: :json

        request_result = assigns(:saving_goal)

        expect(response.status).to eql 201
        expect(request_result.user_id).to eq @mocked_user.id.to_s
        expect(request_result.value).to eq saving_goal_mock[:value]
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
      it 'updates the requested saving_goal' do
        mocked_saving_goal = SavingGoal.new(user_id: @mocked_user.id,
                                            description: 'goal description',
                                            deadline: '2099-01-01',
                                            value: 2700)
        mocked_saving_goal.save

        updated_saving_goal_mock = {
          id: mocked_saving_goal.id,
          user_id: @mocked_user.id,
          description: 'goal description',
          deadline: '2099-01-01',
          value: 3700
        }

        put :update, params: updated_saving_goal_mock, format: :json

        expect(response.status).to eql 202

        mocked_saving_goal.destroy
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested saving_goal' do
      mocked_saving_goal = SavingGoal.new(user_id: @mocked_user.id,
                                          description: 'goal description',
                                          deadline: '2099-01-01',
                                          value: 2700)
      mocked_saving_goal.save

      delete :destroy,
             params: {
               user_id: @mocked_user.id,
               id: mocked_saving_goal.id
             },
             format: :json

      expect(response.status).to eq(204)

      mocked_saving_goal.destroy
    end
  end
end
