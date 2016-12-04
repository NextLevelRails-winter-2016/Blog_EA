require 'rails_helper'

RSpec.describe Post, type: :model do
    # subject { described_class.new(title: "Anything", article:"bob@anything.com")}
    let(:post) { build_stubbed(:post) }

    describe 'Validations' do
        it 'has a valid factory' do
            expect(post).to be_valid
        end

        it 'is valid with valid attributes' do
            expect(post).to be_valid
        end

        it 'is not valid without a title' do
            post.title = nil
            expect(post).to_not be_valid
        end

        it 'is not valid without a article' do
            post.article = nil
            expect(post).to_not be_valid
        end
    end

    describe 'Associations' do
        it { should belong_to(:user) }
    end
end
