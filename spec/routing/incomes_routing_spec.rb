# frozen_string_literal: true
require 'rails_helper'

RSpec.describe IncomesController, type: :routing do
  it { expect(get:    '/incomes').to   route_to('incomes#index') }
  it { expect(get:    '/incomes/1').to route_to('incomes#show', id: '1') }
  it { expect(post:   '/incomes').to   route_to('incomes#create') }
  it { expect(put:    '/incomes/1').to route_to('incomes#update', id: '1') }
  it { expect(delete: '/incomes/1').to route_to('incomes#destroy', id: '1') }
end
