require 'rails_helper'

RSpec.describe "UserFlows", :type => :request do
  describe "GET /user_flows" do
    before :each do
      @user = Account.create!(:email => 'user@example.com', :password => 'password')
    end

    it "should sign up user" do
      sign_up_with 'Colleen', 'Masterson', 'valid@example.com', 'password', 'password'
      expect(page).to have_content('Welcome! You have signed up successfully.')
    end
    
    it "should not sign up with invalid password" do
      sign_up_with 'Colleen', 'Masterson', 'valid@example.com', 'pass','pass'
      expect(page).to have_content('Sign in')
    end

    it "should not sign up with unmatching passwords" do
      sign_up_with 'Colleen', 'Masterson', 'valid@example.com', 'password','password456'
      expect(page).to have_content('Sign in')
    end

    it "should not sign up with no password confirmation" do
      sign_up_with 'Colleen', 'Masterson', 'valid@example.com', 'password',''
      expect(page).to have_content('Sign in')
    end

    it "should not sign up with invalid email" do
      sign_up_with 'Colleen', 'Masterson', 'invalid', 'password','password456'
      expect(page).to have_content("Sign in")
    end

    it "should sign in user" do
      visit '/accounts/sign_in'
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
      click_button 'Sign in'
      expect(page).to have_content('Listing courses')
    end

    it 'should sign out user' do
      sign_in("user@example.com", "password")
      click_link 'Logout'
      expect(page).to have_content('Signed out successfully.')
    end 

    def sign_up_with(first_name, last_name, email, password, password_confirmation)
      visit('/accounts/sign_up')
      fill_in 'First Name', with: first_name
      fill_in 'Last Name', with: last_name
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password Confirmation', with: password_confirmation
      click_button 'Sign up'
    end

    def sign_in(email, password)
      visit '/accounts/sign_in'
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
      click_button 'Sign in'
    end

  end 
end
