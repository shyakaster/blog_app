require 'rails_helper'
RSpec.feature "Showing article" do
  before do
    @article= Article.create(title: "Showing article test", body: "Showing article body test")
  end
  scenario "Click article title to show article" do
    visit "/"
    click_link @article.title
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(page.current_path).to eq(article_path(@article))
  end

end