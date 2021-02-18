require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "title" do
    context "blankのときに" do
      it 'invalidになる' do
        post = build(:post, title: "")
        expect(post).not_to be_valid
      end
    end
  end
end
