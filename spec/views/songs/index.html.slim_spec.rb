# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'songs/index' do
  before do
    assign(:songs, [
             Song.create!(
               release: nil,
               title: 'Title',
               isrc: 'Isrc',
               track_number: 2,
               disk_number: 3,
               comment: 'Comment',
               composer: 'Composer'
             ),
             Song.create!(
               release: nil,
               title: 'Title',
               isrc: 'Isrc',
               track_number: 2,
               disk_number: 3,
               comment: 'Comment',
               composer: 'Composer'
             )
           ])
  end

  it 'renders a list of songs' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Title'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Isrc'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Comment'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Composer'.to_s), count: 2
  end
end
