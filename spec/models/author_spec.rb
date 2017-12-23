require 'rspec'
require 'rails_helper'
describe Author do
  before { @author = create(:author) }
  subject { @author }
  it { should be_valid }
  it "check author validation with should matcher" do
    @author.should be_valid
  end
  it "check author validation with expectation" do
    expect(@author).to be_valid
  end
end
