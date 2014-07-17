require 'rails_helper'

RSpec.describe "UserFlows", :type => :request do
  describe "GET /user_flows" do
    # it "works! (now write some real specs)" do
    #   get user_flows_index_path
    #   expect(response.status).to be(200)
    # end
    it "should sign up user" do
      sign_up_with 'valid@example.com', 'password', 'password'
      expect(page).to have_content('Welcome! You have signed up successfully.')
    end
    
    it "should not sign up with invalid password" do
      sign_up_with 'valid@example.com', 'pass','pass'
      expect(page).to have_content('Sign in')
    end

    it "should not sign up with unmatching passwords" do
      sign_up_with 'valid@example.com', 'password','password456'
      expect(page).to have_content('Sign in')
    end

    it "should not sign up with no password confirmation" do
      sign_up_with 'valid@example.com', 'password',''
      expect(page).to have_content('Sign in')
    end

    it "should not sign up with invalid email" do
      sign_up_with 'invalid', 'password','password456'
      expect(page).to have_content("Sign in")
    end

    def sign_up_with(email, password, password_confirmation)
      # visit new_account_registration_path
      visit('/accounts/sign_up')
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password_confirmation
      click_button 'Sign up'
    end
  end 
end
