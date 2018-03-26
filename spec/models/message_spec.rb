require 'rails_helper'

RSpec.describe Message, type: :model do
  subject { Message.new }

  it { is_expected.to be_a(Message) }
  it { is_expected.to validate_presence_of(:text) }
  it { is_expected.to belong_to(:user) }

  describe '#text' do
    let!(:message) { create(:message, text: 'Hello World!')}

    it 'automatically upcases text' do
      expect(message.text).to eq('HELLO WORLD!')
    end
  end

  describe '.message_history' do
    before do
      create_list(:message, 11)
    end

    it 'returns last 10 records' do
      expect(Message.message_history.count).to eq(10)
    end
  end
end
