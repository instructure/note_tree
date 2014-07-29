module ControllerMacros  
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:account]
      user = Account.create(:password => "password", :password_confirmation => "password", :email => "test@email.com")
      sign_in user
    end
  end
end