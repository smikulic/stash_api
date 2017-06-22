# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Api::SavingGoalsController, type: :controller do
  # it_behaves_like 'api_controller'

  # This should return the minimal set of attributes required to create a valid
  # Saving goal.
  let(:valid_attributes) do
    { user_id: '1',
      description: 'Random Goal 1',
      deadline: 'Sun, 06 Nov 2016 12:04:10 +0100',
      value: 2700 }
  end

  let(:invalid_attributes) do
    { user_id: nil,
      description: 'Random Goal 1',
      deadline: 'Sun, 06 Nov 2016 12:04:10 +0100',
      value: 2700 }
  end

  let!(:saving_goal) { SavingGoal.create(valid_attributes) }

  describe 'GET #index' do
    it 'assigns all saving_goals as @saving_goals' do
      mocked_user = User.new(email: 'admin@name.com',
                             password: 'password',
                             password_confirmation: 'password')
      mocked_user.skip_confirmation!
      mocked_user.save

      mocked_saving_goal = SavingGoal.new(user_id: mocked_user.id,
                                          description: 'goal description',
                                          deadline: '2099-01-01',
                                          value: 2700)
      mocked_saving_goal.save

      get :index, params: { user_id: mocked_user.id }, format: :json

      request_result = assigns(:saving_goals)
      expect(response.status).to eql 200
      expect(request_result).to include(mocked_saving_goal)

      mocked_user.destroy
      mocked_saving_goal.destroy
    end
  end

  describe 'GET #show' do
    it 'assigns the requested saving_goal as @saving_goal' do
      mocked_user = User.new(email: 'admin@name.com',
                             password: 'password',
                             password_confirmation: 'password')
      mocked_user.skip_confirmation!
      mocked_user.save

      mocked_saving_goal = SavingGoal.new(user_id: mocked_user.id,
                                          description: 'goal description',
                                          deadline: '2099-01-01',
                                          value: 2700)
      mocked_saving_goal.save

      get :show,
          params: {
            user_id: mocked_user.id,
            id: mocked_saving_goal.id
          },
          format: :json

      request_result = assigns(:saving_goal)
      expect(response.status).to eql 200
      expect(request_result).to include(mocked_saving_goal)

      mocked_user.destroy
      mocked_saving_goal.destroy
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let!(:new_saving_goal) { SavingGoal.create(valid_attributes) }
      # it 'creates a new SavingGoal' do
      #   expect do
      #     SavingGoal.create(valid_attributes)
      #   end.to change(SavingGoal, :count).by(1)
      # end

      it 'assigns a newly created saving_goal as @saving_goal' do
        expect(new_saving_goal).to be_a(SavingGoal)
        # expect(new_saving_goal).to be_persisted
      end
    end

    # context 'with invalid params' do
    #   it 'assigns a newly created but unsaved saving_goal as @saving_goal' do
    #     post :create, saving_goal: invalid_attributes, format: :json
    #     expect(assigns(:saving_goal)).to be_a_new(SavingGoal)
    #   end

    #   it 'returns unprocessable_entity status' do
    #     put :create, saving_goal: invalid_attributes
    #     expect(response.status).to eq(422)
    #   end
    # end
  end

  # describe 'PUT #update' do
  #   context 'with valid params' do
  #     let(:new_attributes) do
  #       { user_id: '123abc',
  #         title: 'Random Bank AG',
  #         category: 'Salary',
  #         value: 170_000,
  #         currency: 'EUR',
  #         entry_date: 'Sun, 06 Nov 2016 12:04:10 +0100' }
  #     end

  #     it 'updates the requested income' do
  #       put :update, id: income.id, income: new_attributes, format: :json
  #       income.reload
  #       expect(income.value).to eq(170_000)
  #       expect(income.currency).to eq('EUR')
  #     end

  #     it 'assigns the requested income as @income' do
  #       put :update, id: income.id, income: valid_attributes, format: :json
  #       expect(assigns(:income)).to eq(income)
  #     end
  #   end

  #   context 'with invalid params' do
  #     it 'assigns the income as @income' do
  #       put :update, id: income.id, income: invalid_attributes, format: :json
  #       expect(assigns(:income)).to eq(income)
  #     end

  #     it 'returns unprocessable_entity status' do
  #       put :update, id: income.id, income: invalid_attributes, format: :json
  #       expect(response.status).to eq(422)
  #     end
  #   end
  # end

  # describe 'DELETE #destroy' do
  #   it 'destroys the requested saving_goal' do
  #     expect do
  #       delete :destroy, params: { id: saving_goal.id }, format: :json
  #     end.to change(SavingGoal, :count).by(-1)
  #   end

  #   it 'redirects to the saving saving_goals list' do
  #     delete :destroy, params: { id: saving_goal.id }, format: :json
  #     expect(response.status).to eq(204)
  #   end
  # end
end
