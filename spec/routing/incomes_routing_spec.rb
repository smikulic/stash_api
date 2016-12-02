# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Api::IncomesController, type: :routing do
  it do
    expect(get:    '/api/incomes').to route_to('api/incomes#index')
  end
  it do
    expect(get:    '/api/incomes/1').to route_to('api/incomes#show', id: '1')
  end
  it do
    expect(post:   '/api/incomes').to route_to('api/incomes#create')
  end
  it do
    expect(put:    '/api/incomes/1').to route_to('api/incomes#update', id: '1')
  end
  it do
    expect(delete: '/api/incomes/1').to route_to('api/incomes#destroy', id: '1')
  end
end
