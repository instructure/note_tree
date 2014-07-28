class Account < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  belongs_to :student 
  belongs_to :teacher

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #user method for getting the id and returning if it's a student or teacher --> boolean 
  #account.student? --> should return boolean 

  def student?
    student_id?
  end

  def teacher?
    teacher_id? 
  end
end
