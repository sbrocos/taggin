# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'songs/new' do
  before do
    assign(:song, Song.new(
                    album: nil,
                    title: 'MyString',
                    isrc: 'MyString',
                    track_number: 1,
                    disk_number: 1,
                    comment: 'MyString',
                    composer: 'MyString'
                  ))
  end

  it 'renders new song form' do
    render

    assert_select 'form[action=?][method=?]', songs_path, 'post' do
      assert_select 'input[name=?]', 'song[release_id]'

      assert_select 'input[name=?]', 'song[title]'

      assert_select 'input[name=?]', 'song[isrc]'

      assert_select 'input[name=?]', 'song[track_number]'

      assert_select 'input[name=?]', 'song[disk_number]'

      assert_select 'input[name=?]', 'song[comment]'

      assert_select 'input[name=?]', 'song[composer]'
    end
  end
end
