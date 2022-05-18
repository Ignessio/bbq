require 'rails_helper'

RSpec.describe EventPolicy, type: :policy do
  let(:user) { User.create!(name: 'User', email: 'user@me.ru', password: '123456') }
  let(:event) { Event.create(title: 'Event', address: 'Address', datetime: Time.now, user: user) }
  let(:guest) { User.create!(name: 'Guest', email: 'guest@me.ru', password: '123456') }

  subject { described_class }

  describe 'user permitted' do
    permissions :create? do
      it { is_expected.to permit(user, Event) }
    end

    permissions :show? do
      it { is_expected.to permit(user, event) }
    end

    permissions :edit? do
      it { is_expected.to permit(user, event) }
    end

    permissions :update? do
      it { is_expected.to permit(user, event) }
    end

    permissions :destroy? do
      it { is_expected.to permit(user, event) }
    end
  end

  describe 'user unpermitted' do
    permissions :create? do
      it { is_expected.not_to permit(nil, Event) }
    end

    permissions :show? do
      it { is_expected.to permit(guest, event) }
    end

    permissions :edit? do
      it { is_expected.not_to permit(guest, event) }
    end

    permissions :update? do
      it { is_expected.not_to permit(guest, event) }
    end

    permissions :destroy? do
      it { is_expected.not_to permit(guest, event) }
    end
  end
end
