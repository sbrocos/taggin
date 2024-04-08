# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Songs::Tag, type: :interaction do
  describe 'execute' do
    let(:path) { file_fixture_path }
    let(:inputs) { { path: } }
  end

  context 'when don\'t exist songs previously' do
    it 'returns something' do
      binding.pry
      expect(result).to eq(1)
    end
  end
end
