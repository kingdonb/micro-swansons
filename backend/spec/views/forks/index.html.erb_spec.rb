require 'rails_helper'

RSpec.describe "forks/index", type: :view do
  before(:each) do
    assign(:forks, [
      Fork.create!(
        :position => 2,
        :clean => false,
        :table => nil
      ),
      Fork.create!(
        :position => 2,
        :clean => false,
        :table => nil
      )
    ])
  end

  it "renders a list of forks" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
