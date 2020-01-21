require 'rails_helper'

RSpec.describe "tables/index", type: :view do
  before(:each) do
    assign(:tables, [
      Table.create!(
        :name => "Name",
        :seats => 2
      ),
      Table.create!(
        :name => "Name",
        :seats => 2
      )
    ])
  end

  it "renders a list of tables" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
