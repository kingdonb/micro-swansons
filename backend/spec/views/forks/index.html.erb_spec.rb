require 'rails_helper'

RSpec.describe "forks/index", type: :view do
  let(:table) { Table.create! }
  before(:each) do
    assign(:table, table)
    assign(:forks, [
      Fork.create!(
        :position => 2,
        :clean => false,
        :table => table
      ),
      Fork.create!(
        :position => 2,
        :clean => false,
        :table => table
      )
    ])
  end

  it "renders a list of forks" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => table.id.to_s, :count => 2
  end
end
