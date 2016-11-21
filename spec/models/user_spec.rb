require 'rails_helper'

RSpec.describe User, type: :model do
  #subject { described_class.new(username: "Anything", email:"bob@anything.com")}
  let(:user){ build(:user) }

  describe "Validations" do
    it "has a valid factory" do
      expect(user).to be_valid
    end

    it "is valid with valid attributes" do
      expect(user).to be_valid
    end

    it "is not valid without a username" do
      user.username = nil
      expect(user).to_not be_valid
    end

    it "is not valid without a email" do
      user.email = nil
      expect(user).to_not be_valid
    end

  describe "Associations" do
      it { should have_many(:posts) }
  end
end
end
