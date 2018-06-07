# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::BankAccountsController, type: :routing do
  it do
    expect(get: '/api/users/1/bank_accounts').to route_to(
      'api/bank_accounts#index', user_id: '1'
    )
  end
  it do
    expect(get: '/api/users/1/bank_accounts/1').to route_to(
      'api/bank_accounts#show', user_id: '1', id: '1'
    )
  end
  it do
    expect(post: '/api/users/1/bank_accounts').to route_to(
      'api/bank_accounts#create', user_id: '1'
    )
  end
  it do
    expect(put: '/api/users/1/bank_accounts/1').to route_to(
      'api/bank_accounts#update', user_id: '1', id: '1'
    )
  end
  it do
    expect(delete: '/api/users/1/bank_accounts/1').to route_to(
      'api/bank_accounts#destroy', user_id: '1', id: '1'
    )
  end
end
