require 'rails_helper'

RSpec.describe "forks/new", type: :view do
  before(:each) do
    assign(:fork, Fork.new(
      :position => 1,
      :clean => false,
      :table => nil
    ))
  end

  it "renders new fork form" do
    render

    assert_select "form[action=?][method=?]", forks_path, "post" do

      assert_select "input[name=?]", "fork[position]"

      assert_select "input[name=?]", "fork[clean]"

      assert_select "input[name=?]", "fork[table_id]"
    end
  end
end
