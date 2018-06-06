require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = User.new(
        name: 'Example User',
        email: 'user@example.com',
        password: "foobar",
        password_confirmation: "foobar"
    )
  end

  it 'is valid with a username,email' do
    expect(@user).to be_valid
  end

  it 'is invalid without a username' do
    @user.name = " "
    expect(@user).to_not be_valid
  end

  it 'is invalid without a email' do
    @user.email = " "
    expect(@user).to_not be_valid
  end

  it 'is invalid too long a username' do
    @user.name = 'a' * 51
    expect(@user).to_not be_valid
  end

  it 'is invalid too long a email' do
    @user.name = 'a' * 244 + '@example.com'
    expect(@user).to_not be_valid
  end

  it 'is email valid' do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                        first.last@foo.jp alice+bob@baz.cn]


    valid_addresses.each do |valid_address|
      @user.email = valid_address
      @user.valid?

      expect(@user.errors[:email]).to_not include('is invalid')
    end
  end

  it 'is email invalid' do
    #valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
    #                     first.last@foo.jp alice+bob@baz.cn]

    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]

    invalid_addresses.each do |valid_address|
      @user.email = valid_address
      @user.valid?

      expect(@user.errors[:email]).to include("is invalid")
    end
  end

  it 'is email unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    expect(duplicate_user).to_not be_valid

  end

  it 'is email save as lower-case' do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email= mixed_case_email
    @user.save
    expect(@user.email).to eq mixed_case_email.downcase
  end

  describe "password valid" do

    it 'is password brank' do
      @user.password = @user.password_confirmation = " " * 6
      expect(@user).to_not be_valid
    end

    it 'is password length minimum' do
      @user.password = @user.password_confirmation = "a" * 5
      expect(@user).to_not be_valid
    end
  end

end
