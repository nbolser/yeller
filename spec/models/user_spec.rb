require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new }

  it { is_expected.to be_a(User) }

  context 'User creation' do
    let(:password) { 'password' }
    let(:confirmation) { 'password' }
    let(:user) { build_stubbed(:user, password: password) }

    context 'creating a new user' do
      it 'will be valid with email and suitable password' do
        expect(user).to be_valid
      end
    end

    context 'when no password is submitted' do
      let(:password) { nil }

      it 'will not be valid' do
        expect(user).not_to be_valid
      end
    end
  end
end
