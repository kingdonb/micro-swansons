require 'rails_helper'

RSpec.describe "forks/show", type: :view do
  let(:table) { Table.create! }
  before(:each) do
    @table = assign(:table, table)
    @fork = assign(:fork, Fork.create!(
      :position => 2,
      :clean => false,
      :table => table
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
