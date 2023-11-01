require "rails_helper"

RSpec.describe PageLinksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/page_links").to route_to("page_links#index")
    end

    it "routes to #new" do
      expect(get: "/page_links/new").to route_to("page_links#new")
    end

    it "routes to #show" do
      expect(get: "/page_links/1").to route_to("page_links#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/page_links/1/edit").to route_to("page_links#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/page_links").to route_to("page_links#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/page_links/1").to route_to("page_links#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/page_links/1").to route_to("page_links#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/page_links/1").to route_to("page_links#destroy", id: "1")
    end
  end
end
