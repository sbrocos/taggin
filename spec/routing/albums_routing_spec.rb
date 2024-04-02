# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AlbumsController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/albums').to route_to('releases#index')
    end

    it 'routes to #new' do
      expect(get: '/albums/new').to route_to('releases#new')
    end

    it 'routes to #show' do
      expect(get: '/albums/1').to route_to('releases#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/albums/1/edit').to route_to('releases#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/albums').to route_to('releases#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/albums/1').to route_to('releases#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/albums/1').to route_to('releases#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/albums/1').to route_to('releases#destroy', id: '1')
    end
  end
end
