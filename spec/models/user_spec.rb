require 'rails_helper'

RSpec.describe User, type: :model do
  let(:params) do
    {
      username: "user",
      email: "email",
      password: "pass",
      password_confirmation: "pass",
    }
  end

  it "requires a password to be set" do
    params.delete(:password)
    params.delete(:password_confirmation)
    user = User.new(params)
    user.save
    assert user.errors[:password].count == 1
  end

  it "requires a username to be set" do
    params.delete(:username)
    user = User.new(params)
    user.save

    assert user.errors[:username].count == 1
  end

  it "requires a email to be set" do
    params.delete(:email)
    user = User.new(params)
    user.save

    assert user.errors[:email].count == 2
  end

  it "requires a valid email format" do
    params[:email] = "foo"
    user = User.new(params)
    user.save

    assert user.errors[:email].count == 1
  end
end
