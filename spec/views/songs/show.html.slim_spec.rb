# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'songs/show' do
  before do
    assign(:song, Song.create!(
                    album: nil,
                    title: 'Title',
                    isrc: 'Isrc',
                    track_number: 2,
                    disk_number: 3,
                    comment: 'Comment',
                    composer: 'Composer'
                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Isrc/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Comment/)
    expect(rendered).to match(/Composer/)
  end
end
