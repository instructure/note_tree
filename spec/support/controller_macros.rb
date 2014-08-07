module ControllerMacros  
  def login_student
    before (:each) do 
      @request.env["devise.mapping"] = Devise.mappings[:account]
      student = Student.create!
      user = Account.create(:password => "Password_student", :password_confirmation => "Password_student", :email => "test@email.com", :student => student)
      sign_in user
      user
    end
  end

  def login_teacher
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:account]
      teacher = Teacher.create!
      user = Account.create(:password => "password", :password_confirmation => "password", :email => "test@email.com", :teacher => teacher)
      sign_in user
      user
    end
  end
end