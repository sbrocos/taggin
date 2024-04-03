# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'albums/edit' do
  let(:album) do
    Album.create!(
      title: 'MyString',
      label: 'MyString',
      upc: 'MyString'
    )
  end

  before do
    assign(:album, album)
  end

  it 'renders the edit release form' do
    render

    assert_select 'form[action=?][method=?]', release_path(album), 'post' do
      assert_select 'input[name=?]', 'release[title]'

      assert_select 'input[name=?]', 'release[label]'

      assert_select 'input[name=?]', 'release[upc]'
    end
  end
end
