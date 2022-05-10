require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new
    @user.first_name = 'Will'
    @user.last_name = 'Frankland'
    @user.email = 'test@test.com'
    @user.password = 'Willard69'
    @user.password_confirmation = 'Willard69'
  end
  describe 'Validations' do
      context 'all fields have values' do
        it 'returns true' do
          expect(@user.valid?).to be true
      end
    end
    context 'add user without first name' do
      it 'throws error for no first name' do
        @user.first_name = nil
        @user.save
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
    end
    context 'add user without last name' do
      it 'throws error for no last name' do
        @user.last_name = nil
        @user.save
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
    end
    context 'add user without email' do
      it 'throws error for no email' do
        @user.email = nil
        @user.save
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
    end
    context 'add user without password' do
      it 'throws error for no password' do
        @user.password = nil
        @user.save
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
    end
  context 'given password and password confirmation are different' do
    it 'should fail for wrong password' do
      @user.password_confirmation = 'hello'
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
    context 'email must be unique(not case sensitive)' do
      it 'returns email already taken' do
        @user1 = User.new
        @user1.first_name = 'William'
        @user1.last_name = 'Franklands'
        @user1.password = 'Willard69'
        @user1.password_confirmation = 'Willard69'
        @user1.email = 'test@test.com'
        @user.save
        @user1.save
        expect(@user1.errors.full_messages).to include('Email has already been taken')
      end
    end
    context 'password not long enough' do
      it 'password must be 8 charecters long' do
        @user.password = '1234567'
        @user.password_confirmation = '1234567'
        @user.save
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 8 characters)')
      end
    end
  end
  describe '.authenticate_with_credentials' do
    context ' user authentication is successful with correct email and password' do
    it 'returns an instance of user' do
    @user.save
    user = User.authenticate_with_credentials(@user.email, @user.password)
      expect(user).to be_instance_of(User)
    end
  end
    context ' user authentication is unsuccessful with wrong password' do
    it 'returns nil' do
    @user.save
    user = User.authenticate_with_credentials(@user.email, 'password')
      expect(user).to be_nil
      end
    end
    context ' user authentication is unsuccessful with wrong email' do
    it 'returns nil' do
    @user.save
    user = User.authenticate_with_credentials('email', @user.password)
      expect(user).to be_nil
      end
    end
    context ' user authentication is successful with spaces before or after email' do
    it 'returns user' do
    @user.email = '  123@123.com  '
    @user.save
    user = User.authenticate_with_credentials(@user.email, @user.password)
      expect(user).to be_instance_of(User)
      end
    end
    context ' user authentication is successful with upper and lower case email' do
    it 'returns user' do
    @user.email = 'HelPmE@test.com'
    @user.save
    user = User.authenticate_with_credentials(@user.email, @user.password)
      expect(user).to be_instance_of(User)
      end
    end
  end
end