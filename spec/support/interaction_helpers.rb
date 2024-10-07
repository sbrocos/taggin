# frozen_string_literal: true

RSpec.shared_context 'with interactions' do
  subject { result }

  let(:inputs) { {} }
  let(:outcome) do
    described_class.run(inputs)
  end
  let(:result) { outcome.result }
  let(:errors) { outcome.errors.messages }
end

RSpec.configure do |rspec|
  rspec.include_context 'with interactions', type: :interaction
end
