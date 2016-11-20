require 'rails_helper'
RSpec.describe UserSessionsController, type: :controller do

  let!(:user) do
    User.create(
      username: username,
      password: password,
      email: email,
    )
  end

  let(:username) { "foo" }
  let(:password) { "bar" }
  let(:email) { "foo@bar.com" }

  it "authenticates valid user creds" do
    post :create, params: { session: { username: username, password: password } }
    expect(response).to redirect_to(user)
  end

  it "rejects bad creds" do
    post :create, params: { session: { username: username, password: password*2} }
    expect(response).to redirect_to('/sessions/new')
  end


  it "redirects when already signed in" do
    session[:user_id] = user.id
    get :new
    expect(response).to redirect_to(user)
  end
end
