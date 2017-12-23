require 'rspec'
require 'rails_helper'
describe User do
  before { @user = create(:user) }
  subject { @user }
  it { should be_valid }
  it "check user validation with should matcher" do 
    @user.should be_valid
  end
  it "check user validation with expectation" do
    expect(@user).to be_valid
  end
end
