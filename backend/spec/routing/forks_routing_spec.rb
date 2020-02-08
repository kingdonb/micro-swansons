require "rails_helper"

RSpec.describe ForksController, type: :routing do
  describe "routing" do
    context "each fork" do
      it "pick_up member" do
        expect(:get => "/forks/1/pick_up").to route_to("forks#pick_up", :id => "1")
      end

      it "put_down member" do
        expect(:get => "/forks/1/put_down").to route_to("forks#put_down", :id => "1")
      end

      it "give_to member" do
        expect(:post => "/forks/1/give_to").to route_to("forks#give_to", :id => "1")
      end

      it "clean member" do
        expect(:get => "/forks/1/clean").to route_to("forks#clean", :id => "1")
      end
    end

    it "routes to #index" do
      expect(:get => "/tables/1/forks").to route_to("forks#index", table_id: "1")
    end

    it "routes to #new" do
      expect(:get => "/tables/1/forks/new").to route_to("forks#new", table_id: "1")
    end

    it "routes to #show" do
      expect(:get => "/forks/1").to route_to("forks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/forks/1/edit").to route_to("forks#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/tables/1/forks").to route_to("forks#create", table_id: "1")
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
