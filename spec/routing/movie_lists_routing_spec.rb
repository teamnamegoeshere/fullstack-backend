require "rails_helper"

RSpec.describe MovieListsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/movie_lists").to route_to("movie_lists#index")
    end

    it "routes to #show" do
      expect(get: "/movie_lists/1").to route_to("movie_lists#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/movie_lists").to route_to("movie_lists#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/movie_lists/1").to route_to("movie_lists#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/movie_lists/1").to route_to("movie_lists#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/movie_lists/1").to route_to("movie_lists#destroy", id: "1")
    end
  end
end
