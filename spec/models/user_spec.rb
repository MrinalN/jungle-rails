require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it "must be created with password and password_confirmation" do
      @user = User.create(first_name:'John', last_name: 'Smith', email: 'john@smith.ca', password: 'password', password_confirmation: 'password')
      expect(@user).to be_valid
    end

    it "must match password and password_confirmation" do
      @user = User.create(first_name:'Kate', last_name: 'Cross', email: 'kate@cross.ca', password: 'password', password_confirmation: 'chair')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "does not duplicate a pre-existing email registered" do
      @user1 = User.create(first_name:'Paul', last_name: 'Doppleganger', email: 'paul@ball.ca', password: 'password', password_confirmation: 'password')
      @user2 = User.create(first_name:'Paul', last_name: 'Ball', email: 'paul@ball.ca', password: 'password', password_confirmation: 'password')
      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it "is not case sensitive with email input" do
      @user = User.create(first_name:'Coco', last_name: 'Larouse', email: 'COCO@gmail.ca', password: 'password', password_confirmation: 'password')
      expect(@user).to be_valid
      expect(@user.email).to match(/coco@gmail.ca/i)
    end

    it "does not accept passwords less than minimum length of 6" do
      @user = User.create(first_name:'Yellow', last_name: 'Truck', email: 'truck@gmail.ca', password: 'what', password_confirmation: 'what')
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here

    it ".authenticate_with_credentials fails if email and password input do not match db" do
      @user = User.create(first_name:'Chica', last_name: 'Bonita', email: 'chica@gmail.ca', password: 'cherryblossom', password_confirmation: 'cherryblossom')
      expect(User.authenticate_with_credentials('something', 'not right')).to be_nil
    end

    it ".authenticate_with_credentials succeeds if input email and matches one in db" do
      @user = User.create(first_name:'Carly', last_name: 'Mcmillan', email: 'carly@gmail.ca', password: 'cherryblossom', password_confirmation: 'cherryblossom')
      auth_user = User.authenticate_with_credentials('carly@gmail.ca', 'cherryblossom')
      expect(auth_user.email).to eq(@user.email)
    end

    it ".authenticate_with_credentials succeeds despite leading and trailing space in email input" do
      @user = User.create(first_name:'Corgi', last_name: 'Dog', email: 'dog@gmail.ca', password: 'password', password_confirmation: 'password')
      auth_user = User.authenticate_with_credentials('  dog@gmail.ca  ', 'password')
      expect(@user).to be_valid
      expect(auth_user.email).to eq('dog@gmail.ca')
    end

  end

end
