require 'rspec'
require 'rails_helper'
describe Cart do
  before { @cart = create(:cart) }
  subject { @cart }
  it { should be_valid }
  it "check cart validation with should matcher" do
    @cart.should be_valid
  end
  it "check cart validation with expectation" do
    expect(@cart).to be_valid
  end
end
