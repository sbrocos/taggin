# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'you/albums/new' do
  let(:album) { build(:album) }

  before { assign(:album, album) }

  it 'renders new album form' do
    render

    assert_select 'form[action=?][method=?]', you_albums_path, 'post' do
      assert_select 'input[name=?]', 'album[title]'

      assert_select 'input[name=?]', 'album[label]'

      assert_select 'input[name=?]', 'album[upc]'
    end
  end
end
