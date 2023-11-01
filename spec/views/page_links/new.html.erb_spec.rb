require 'rails_helper'

RSpec.describe "page_links/new", type: :view do
  before(:each) do
    assign(:page_link, PageLink.new(
      page: nil,
      title: "MyString",
      url: "MyString"
    ))
  end

  it "renders new page_link form" do
    render

    assert_select "form[action=?][method=?]", page_links_path, "post" do

      assert_select "input[name=?]", "page_link[page_id]"

      assert_select "input[name=?]", "page_link[title]"

      assert_select "input[name=?]", "page_link[url]"
    end
  end
end
