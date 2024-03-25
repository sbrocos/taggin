# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'releases/edit' do
  let(:release) do
    Release.create!(
      title: 'MyString',
      label: 'MyString',
      upc: 'MyString'
    )
  end

  before do
    assign(:release, release)
  end

  it 'renders the edit release form' do
    render

    assert_select 'form[action=?][method=?]', release_path(release), 'post' do
      assert_select 'input[name=?]', 'release[title]'

      assert_select 'input[name=?]', 'release[label]'

      assert_select 'input[name=?]', 'release[upc]'
    end
  end
end
