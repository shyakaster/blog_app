require 'rails_helper'

RSpec.feature "Edit an Article" do
  before do
    john=User.create(email:"shyakaster@gmail.com",password:"password")
    login_as (john)
    @article=Article.create(title: "First article edit", body: "Body of first article edit",user: john)
  end

  scenario "Editing an article" do
    visit '/'

    click_link @article.title
    click_link 'Edit Article'

    fill_in "Title", with: "First article edit again"
    fill_in "Body", with: "Body of first article edit one"
    click_button "Update Article"
    expect(page).to have_content("Article was updated")
    expect(page.current_path).to eq(article_path(@article))
  end
  scenario "Failing to Edit an article" do
    visit '/'

    click_link @article.title
    click_link 'Edit Article'

    fill_in "Title", with: ""
    fill_in "Body", with: "Body of first article edit one"
    click_button "Update Article"
    expect(page).to have_content("Article failed to update")
    expect(page.current_path).to eq(article_path(@article))
  end
end