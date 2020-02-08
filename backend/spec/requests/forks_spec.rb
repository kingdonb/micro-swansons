require 'rails_helper'

RSpec.describe "Forks", type: :request do
  describe "GET /forks" do
    let(:table_id) { t = Table.new; t.save!; t.id }
    it "works! (now write some real specs)" do
      get table_forks_path(table_id)
      expect(response).to have_http_status(200)
    end
  end
end
