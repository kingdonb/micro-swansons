require "rails_helper"

RSpec.describe TablesController, type: :routing do
  describe "routing" do
    context "each table" do
      it "sit member" do
        expect(:get => "/tables/1/sit").to route_to("tables#sit", :id => "1")
      end

      it "eat member" do
        expect(:get => "/tables/1/eat").to route_to("tables#eat", :id => "1")
      end

      it "clear member (for the waiter)" do
        expect(:get => "/tables/1/eat").to route_to("tables#eat", :id => "1")
      end

      it "left_neighbor member" do
        expect(:post => "/tables/1/left_neighbor").to(
          route_to("tables#left_neighbor", :id => "1")
        )
      end

      it "right_neighbor member" do
        expect(:post => "/tables/1/right_neighbor").to(
          route_to("tables#right_neighbor", :id => "1")
        )
      end

      it "my_left_fork member" do
        expect(:post => "/tables/1/my_left_fork").to(
          route_to("tables#my_left_fork", :id => "1")
        )
      end

      it "my_right_fork member" do
        expect(:post => "/tables/1/my_right_fork").to(
          route_to("tables#my_right_fork", :id => "1")
        )
      end
    end

    it "routes to #index" do
      expect(:get => "/tables").to route_to("tables#index")
    end

    it "routes to #new" do
      expect(:get => "/tables/new").to route_to("tables#new")
    end

    it "routes to #show" do
      expect(:get => "/tables/1").to route_to("tables#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tables/1/edit").to route_to("tables#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/tables").to route_to("tables#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tables/1").to route_to("tables#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tables/1").to route_to("tables#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tables/1").to route_to("tables#destroy", :id => "1")
    end
  end
end
