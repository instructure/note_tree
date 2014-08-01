require 'rails_helper'

RSpec.describe "UserType", :type => :request do
  describe "GET /user_type" do

    it 'should recognize student account' do
      @account = Account.create!(:student => Student.create, :email => "test@example.com", :password => "password")
      expect(@account.student?).to eq(true)
    end

    it 'should recognize teacher account' do
      @account = Account.create!(:teacher => Teacher.create, :email => "test@example.com", :password => "password")
      expect(@account.teacher?).to eq(true)
    end

    it 'should not recognize teacher account as student' do
      @account = Account.create!(:teacher => Teacher.create, :email => "test@example.com", :password => "password")
      expect(@account.student?).to eq(false)
    end

     it 'should not recognize student account as teacher' do
      @account = Account.create!(:student => Student.create, :email => "test@example.com", :password => "password")
      expect(@account.teacher?).to eq(false)
    end
  end
end