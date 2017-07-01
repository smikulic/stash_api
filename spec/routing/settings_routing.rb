# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Api::SettingsController, type: :routing do
  it do
    expect(get: '/api/users/1/settings/1').to route_to(
      'api/settings#show',
      user_id: '1',
      id: '1'
    )
  end
  it do
    expect(post: '/api/users/1/settings').to route_to(
      'api/settings#create',
      user_id: '1'
    )
  end
  it do
    expect(put: '/api/users/1/settings/1').to route_to(
      'api/settings#update',
      user_id: '1',
      id: '1'
    )
  end
  it do
    expect(delete: '/api/users/1/settings/1').to route_to(
      'api/settings#destroy',
      user_id: '1',
      id: '1'
    )
  end
end
