# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'releases/new' do
  before do
    assign(:release, Release.new(
                       title: 'MyString',
                       label: 'MyString',
                       upc: 'MyString'
                     ))
  end

  it 'renders new release form' do
    render

    assert_select 'form[action=?][method=?]', releases_path, 'post' do
      assert_select 'input[name=?]', 'release[title]'

      assert_select 'input[name=?]', 'release[label]'

      assert_select 'input[name=?]', 'release[upc]'
    end
  end
end
