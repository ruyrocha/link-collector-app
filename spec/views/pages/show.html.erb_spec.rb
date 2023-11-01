require 'rails_helper'

RSpec.describe "pages/show", type: :view do
  before(:each) do
    assign(:page, Page.create!(
      title: "Title",
      url: "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Url/)
  end
end
