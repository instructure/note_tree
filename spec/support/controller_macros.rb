module ControllerMacros  

  def login_student
    @request.env["devise.mapping"] = Devise.mappings[:account]
    student = Student.create!
    user = Account.create!(:password => "Password_student", :password_confirmation => "Password_student", :email => "#{rand(1..100)}test@email.com", :student => student)
    sign_in user
    user
  end

  def login_teacher
    @request.env["devise.mapping"] = Devise.mappings[:account]
    teacher = Teacher.create!
    user = Account.create!(:password => "password", :password_confirmation => "password", :email => "#{rand(1..100)}teacher@email.com", :teacher => teacher)
    sign_in user
    user
  end
end