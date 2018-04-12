# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::SavingGoalsController, type: :routing do
  it do
    expect(get: '/api/users/1/saving_goals').to route_to(
      'api/saving_goals#index', user_id: '1'
    )
  end
  it do
    expect(get: '/api/users/1/saving_goals/1').to route_to(
      'api/saving_goals#show', user_id: '1', id: '1'
    )
  end
  it do
    expect(post: '/api/users/1/saving_goals').to route_to(
      'api/saving_goals#create', user_id: '1'
    )
  end
  it do
    expect(put: '/api/users/1/saving_goals/1').to route_to(
      'api/saving_goals#update', user_id: '1', id: '1'
    )
  end
  it do
    expect(delete: '/api/users/1/saving_goals/1').to route_to(
      'api/saving_goals#destroy', user_id: '1', id: '1'
    )
  end
end
