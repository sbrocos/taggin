# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Public::AlbumsController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/albums').to route_to('public/albums#index')
    end

    it 'routes to #show' do
      expect(get: '/albums/1').to route_to('public/albums#show', id: '1')
    end

    it 'routes to #new' do
      expect(get: '/albums/new').not_to route_to('public/albums#new')
    end

    it 'routes to #edit' do
      expect(get: '/albums/1/edit').not_to route_to('public/albums#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/albums').not_to route_to('public/albums#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/albums/1').not_to route_to('public/albums#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/albums/1').not_to route_to('public/albums#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/albums/1').not_to route_to('public/albums#destroy', id: '1')
    end
  end
end
