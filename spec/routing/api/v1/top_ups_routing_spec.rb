require 'rails_helper'

RSpec.describe Api::V1::TopUpsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v1/top_ups').to route_to('api/v1/top_ups#index', format: :json)
    end

    it 'routes to #show' do
      expect(get: '/api/v1/top_ups/1').to route_to('api/v1/top_ups#show', id: '1', format: :json)
    end

    it 'routes to #create' do
      expect(post: '/api/v1/top_ups').to route_to('api/v1/top_ups#create', format: :json)
    end

    # it 'routes to #update via PUT' do
    #   expect(put: '/api/v1/top_ups/1').to route_to('api/v1/top_ups#update', id: '1', format: :json)
    # end

    # it 'routes to #update via PATCH' do
    #   expect(patch: '/api/v1/top_ups/1').to route_to('api/v1/top_ups#update', id: '1', format: :json)
    # end

    # it 'routes to #destroy' do
    #   expect(delete: '/api/v1/top_ups/1').to route_to('api/v1/top_ups#destroy', id: '1', format: :json)
    # end
  end
end
