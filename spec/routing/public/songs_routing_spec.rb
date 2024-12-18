# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Public::SongsController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/albums/1/songs').to route_to('public/songs#index', album_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/albums/1/songs/1').to route_to('public/songs#show', id: '1', album_id: '1')
    end

    it 'routes to #new' do
      expect(get: '/albums/1/songs/new').not_to route_to('public/songs#new', album_id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/albums/1/songs/1/edit').not_to route_to('public/songs#edit', id: '1', album_id: '1')
    end

    it 'routes to #create' do
      expect(post: '/albums/1/songs').not_to route_to('public/songs#create', album_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/albums/1/songs/1').not_to route_to('public/songs#update', id: '1', album_id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/albums/1/songs/1').not_to route_to('public/songs#update', id: '1', album_id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/albums/1/songs/1').not_to route_to('public/songs#destroy', id: '1', album_id: '1')
    end
  end
end
