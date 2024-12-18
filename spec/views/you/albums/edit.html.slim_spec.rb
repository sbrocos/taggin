# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'you/albums/edit' do
  let(:album) { create(:album) }

  before { assign(:album, album) }

  it 'renders the edit album form' do
    render

    assert_select 'form[action=?][method=?]', you_album_path(album), 'post' do
      assert_select 'input[name=?]', 'album[title]'

      assert_select 'input[name=?]', 'album[label]'

      assert_select 'input[name=?]', 'album[upc]'
    end
  end
end
