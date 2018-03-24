require 'rails_helper'

RSpec.describe Message, type: :model do
  subject { Message.new }

  it { is_expected.to be_a(Message) }
  it { is_expected.to validate_presence_of(:text) }
  it { is_expected.to belong_to(:user) }
end
