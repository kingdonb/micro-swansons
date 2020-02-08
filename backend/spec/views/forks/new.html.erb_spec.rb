require 'rails_helper'

RSpec.describe "forks/new", type: :view do
  let(:table) { Table.create! }
  before(:each) do
    assign(:table, table)
    assign(:fork, Fork.new(
      :position => 1,
      :clean => false,
      :table => table
    ))
  end

  it "renders new fork form" do
    render

    assert_select "form[action=?][method=?]", table_forks_path(table_id: table.id), "post" do

      assert_select "input[name=?]", "fork[position]"

      assert_select "input[name=?]", "fork[clean]"

      assert_select "input[name=?]", "fork[table_id]"
    end
  end
end
