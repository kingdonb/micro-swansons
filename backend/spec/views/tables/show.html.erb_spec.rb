require 'rails_helper'

RSpec.describe "tables/show", type: :view do
  before(:each) do
    @table = assign(:table, Table.create!(
      :name => "Name",
      :seats => 2
    ))
    @left_fork = assign(:left_fork, Fork.create!(
      table_id: @table.id, position: 1,
    ))
    @right_fork = assign(:right_fork, Fork.create!(
      table_id: @table.id, position: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
