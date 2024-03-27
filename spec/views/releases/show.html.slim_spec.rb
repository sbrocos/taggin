# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'releases/show' do
  before do
    assign(:release, Release.create!(
                       title: 'Title',
                       label: 'Label',
                       upc: 'Upc'
                     ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Label/)
    expect(rendered).to match(/Upc/)
  end
end