require 'rails_helper'

RSpec.describe Api::V1::TransactionsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v1/transactions').to route_to('api/v1/transactions#index', format: :json)
    end

    it 'routes to #show' do
      expect(get: '/api/v1/transactions/1').to route_to('api/v1/transactions#show', id: '1', format: :json)
    end

    it 'routes to #create' do
      expect(post: '/api/v1/transactions').to route_to('api/v1/transactions#create', format: :json)
    end
  end
end
