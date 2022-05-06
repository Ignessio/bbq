require 'rails_helper'

RSpec.describe CommentsPolicy, type: :policy do
  let(:user) { User.create!(name: 'user', email: 'user@me.ru', password: '123456') }
  let(:comment) { Comment.create(body: 'body', user: user) }
  let(:guest) { User.create!(name: 'guest', email: 'guest@me.ru', password: '123456') }

  subject { described_class }

  describe 'user permitted' do
    permissions :create? do
      it { is_expected.to permit(user, Comment) }
    end

    permissions :destroy? do
      it { is_expected.to permit(user, comment) }
    end
  end

  describe 'user unpermitted' do
    permissions :create? do
      it { is_expected.not_to permit(nil, Comment) }
    end

    permissions :destroy? do
      it { is_expected.not_to permit(guest, comment) }
    end
  end
end
