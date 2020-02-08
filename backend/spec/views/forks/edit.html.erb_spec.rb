require 'rails_helper'

RSpec.describe "forks/edit", type: :view do
  let(:table) { Table.create! }
  before(:each) do
    @table = assign(:table, table)
    @fork = assign(:fork, Fork.create!(
      :position => 1,
      :clean => false,
      :table => table
    ))
  end

  it "renders the edit fork form" do
    render

    assert_select "form[action=?][method=?]", fork_path(@fork), "post" do

      assert_select "input[name=?]", "fork[position]"

      assert_select "input[name=?]", "fork[clean]"

      assert_select "input[name=?]", "fork[table_id]"
    end
  end
end
