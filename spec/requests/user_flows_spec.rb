require 'rails_helper'

RSpec.describe "UserFlows", :type => :request do
  describe "GET /user_flows" do
    before :each do
      @user = Account.create!(:email => 'user@example.com', :password => 'password')
    end

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

    it "should sign in user" do
      visit '/accounts/sign_in'
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
      click_button 'Sign in'
      expect(page).to have_content('New Notebook')
    end

    # it 'should sign out user' do
    #   # account = Account.create!
    #   # visit destroy_account_session_path
    #   click_link 'Sign out'
    #   expect(page).to have_content('Sign in')
    # end 

    def sign_up_with(email, password, password_confirmation)
      visit('/accounts/sign_up')
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password_confirmation
      click_button 'Sign up'
    end

  end 
end
