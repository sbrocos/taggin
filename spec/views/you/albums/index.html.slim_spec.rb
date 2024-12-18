# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'you/albums/index' do
  before do
    assign(:albums, create_list(:album, 2))
  end

  it 'renders a list of albums' do
    render
    cell_selector = 'div.info'
    # assert_select cell_selector, text: Regexp.new('Title'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyLabel'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyUPC'.to_s), count: 2
  end
end
