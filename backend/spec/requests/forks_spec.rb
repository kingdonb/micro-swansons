require 'rails_helper'

RSpec.describe "Forks", type: :request do
  describe "GET /forks" do
    it "works! (now write some real specs)" do
      get forks_path
      expect(response).to have_http_status(200)
    end
  end
end
