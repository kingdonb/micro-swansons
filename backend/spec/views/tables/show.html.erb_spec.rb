require 'rails_helper'

RSpec.describe "tables/show", type: :view do
  before(:each) do
    @table = assign(:table, Table.create!(
      :name => "Name",
      :seats => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
