require "rails_helper"

RSpec.describe ForksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/forks").to route_to("forks#index")
    end

    it "routes to #new" do
      expect(:get => "/forks/new").to route_to("forks#new")
    end

    it "routes to #show" do
      expect(:get => "/forks/1").to route_to("forks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/forks/1/edit").to route_to("forks#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/forks").to route_to("forks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/forks/1").to route_to("forks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/forks/1").to route_to("forks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/forks/1").to route_to("forks#destroy", :id => "1")
    end
  end
end
