require "rails_helper"

RSpec.feature "Delete an article" do
  before do
    john=User.create(email:"shyakaster@gmail.com",password:"password")
    login_as (john)
    @article=john.articles.build(title:"first article", body:"Body of first article")
  end

  scenario "Deleting an article" do
    visit "/"
    click_link @article.title
    click_link "Delete Article"
    expect(page).to have_content("Article has been deleted")
    expect(page.current_path).to eq(articles_path)
  end
end