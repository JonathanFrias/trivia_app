require "rails_helper"

RSpec.describe UserSessionsController, type: :routing do
  describe "routing" do

    it "routes to #new" do
      expect(:get => "/sessions/new").to route_to("user_sessions#new")
    end

    it "routes to #create" do
      expect(:post => "/sessions").to route_to("user_sessions#create")
    end

    it "routes to #show" do
      expect(:delete => "/sessions").to route_to("user_sessions#destroy")
    end
  end
end
