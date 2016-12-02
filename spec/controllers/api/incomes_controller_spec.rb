# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Api::IncomesController, type: :controller do
  it_behaves_like 'api_controller'

  # This should return the minimal set of attributes required to create a valid
  # Income.
  let(:valid_attributes) do
    { user_id: '123abc',
      title: 'Random Bank AG',
      category: 'Salary',
      value: 240_000,
      currency: 'EUR',
      entry_date: 'Sun, 06 Nov 2016 12:04:10 +0100' }
  end

  let(:invalid_attributes) do
    { user_id: nil,
      title: 'Random Bank AG',
      category: 'Salary',
      value: 240_000,
      currency: 'EUR',
      entry_date: 'Sun, 06 Nov 2016 12:04:10 +0100' }
  end

  let!(:income) { Income.create(valid_attributes) }

  describe 'GET #index' do
    it 'assigns all incomes as @incomes' do
      get :index, format: :json
      expect(assigns(:incomes)).to eq([income])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested income as @income' do
      get :show, id: income.id, format: :json
      expect(assigns(:income)).to eq(income)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let!(:new_income) { Income.create(valid_attributes) }
      it 'creates a new Income' do
        expect do
          Income.create(valid_attributes)
        end.to change(Income, :count).by(1)
      end

      it 'assigns a newly created income as @income' do
        expect(new_income).to be_a(Income)
        expect(new_income).to be_persisted
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved income as @income' do
        post :create, income: invalid_attributes, format: :json
        expect(assigns(:income)).to be_a_new(Income)
      end

      it 'returns unprocessable_entity status' do
        put :create, income: invalid_attributes
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { user_id: '123abc',
          title: 'Random Bank AG',
          category: 'Salary',
          value: 170_000,
          currency: 'EUR',
          entry_date: 'Sun, 06 Nov 2016 12:04:10 +0100' }
      end

      it 'updates the requested income' do
        put :update, id: income.id, income: new_attributes, format: :json
        income.reload
        expect(income.value).to eq(170_000)
        expect(income.currency).to eq('EUR')
      end

      it 'assigns the requested income as @income' do
        put :update, id: income.id, income: valid_attributes, format: :json
        expect(assigns(:income)).to eq(income)
      end
    end

    context 'with invalid params' do
      it 'assigns the income as @income' do
        put :update, id: income.id, income: invalid_attributes, format: :json
        expect(assigns(:income)).to eq(income)
      end

      it 'returns unprocessable_entity status' do
        put :update, id: income.id, income: invalid_attributes, format: :json
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested income' do
      expect do
        delete :destroy, id: income.id, format: :json
      end.to change(Income, :count).by(-1)
    end

    it 'redirects to the incomes list' do
      delete :destroy, id: income.id, format: :json
      expect(response.status).to eq(204)
    end
  end
end
