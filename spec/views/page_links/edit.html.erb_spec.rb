require 'rails_helper'

RSpec.describe "page_links/edit", type: :view do
  let(:page_link) {
    PageLink.create!(
      page: nil,
      title: "MyString",
      url: "MyString"
    )
  }

  before(:each) do
    assign(:page_link, page_link)
  end

  it "renders the edit page_link form" do
    render

    assert_select "form[action=?][method=?]", page_link_path(page_link), "post" do

      assert_select "input[name=?]", "page_link[page_id]"

      assert_select "input[name=?]", "page_link[title]"

      assert_select "input[name=?]", "page_link[url]"
    end
  end
end
