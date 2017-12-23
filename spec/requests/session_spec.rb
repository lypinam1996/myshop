require 'rails_helper'

describe "Sessions" do
  describe "Sign up page" do
    before { visit new_user_registration_path }

    it "should have 'Sign up' words" do
      expect(page).to have_content 'Sign up'
    end

    it "should have all registration fields" do
      expect(page).to have_content("Full name")
      expect(page).to have_content("Email")
      expect(page).to have_content("Password")
      expect(page).to have_content("Password confirmation")
      expect(page).to have_button("Sign up")
    end
  end

  describe "Login page" do
    before { visit new_user_session_path }

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Log in"
      end

      it "should navigate to productions index page" do
        expect(page).to have_link "Log out"
        expect(page).to have_link "Home"
        expect(page).to have_link "Show all authors"
        expect(page).to have_link "New book"
      end
    end
  end
  describe "New book page" do
    before { visit new_production_path }

    it "should have all fields" do
      expect(page).to have_content("Title")
      expect(page).to have_content("Price")
      expect(page).to have_content("Author")
      expect(page).to have_content("Count")
      expect(page).to have_content("Pages")
    end
  end

end
