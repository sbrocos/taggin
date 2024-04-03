# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'albums/index' do
  before do
    assign(:albums, [
             Album.create!(
               title: 'Title',
               label: 'Label',
               upc: 'Upc'
             ),
             Album.create!(
               title: 'Title',
               label: 'Label',
               upc: 'Upc'
             )
           ])
  end

  it 'renders a list of albums' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Title'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Label'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Upc'.to_s), count: 2
  end
end
