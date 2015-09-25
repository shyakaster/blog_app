require 'rails_helper'
RSpec.feature "Showing article" do
  before do
    @john=User.create(email: "shyakaster@gmail.com",password: "password")
    @fred=User.create(email: "nkusialex@gmail.com",password: "password")
    @article= Article.create(title: "Showing article test", body: "Showing article body test",user: @john)
  end
  scenario "A non-signed_in user cannot see edit and delete links" do
    visit "/"
    click_link @article.title
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(page.current_path).to eq(article_path(@article))
    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article")
  end
  scenario "A non-owner of article cannot see another article's edit and delete links" do
    login_as(@fred)
    visit "/"
    click_link @article.title
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(page.current_path).to eq(article_path(@article))
    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article")
  end
  scenario " A signed user can see both links" do
    login_as(@john)
    visit "/"
    click_link @article.title
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(page.current_path).to eq(article_path(@article))
    expect(page).to have_link("Edit Article")
    expect(page).to have_link("Delete Article")
  end
  scenario "Click article title to show article" do
    visit "/"
    click_link @article.title
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(page.current_path).to eq(article_path(@article))
  end

end