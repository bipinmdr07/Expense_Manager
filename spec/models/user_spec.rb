require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.build(:user) }
  subject { user }

  it { should respond_to(:email) }
  it { should respond_to(:password) }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password) }

  describe 'signup' do
    describe 'need to have equal value of password and password_confirmation' do
      subject { user.password_confirmation }
      it { is_expected.to eq(user.password) }
    end

    describe 'is successful' do
      context 'with valid signup information' do
        it { is_expected.to be_valid }
      end
    end

    describe 'is unsuccessful' do
      context 'with unmatching password and password_confirmation' do
        let(:user) { FactoryGirl.build(:user, :user_with_incorrect_password_confirmation) }

        it { is_expected.not_to be_valid }
      end

      context 'without password' do
        let(:user) { FactoryGirl.build(:user, password: nil) }

        it { is_expected.not_to be_valid }
      end

      context 'without email' do
        let(:user) { FactoryGirl.build(:user, :user_without_email) }

        it { is_expected.not_to be_valid }
      end
    end
  end
end
