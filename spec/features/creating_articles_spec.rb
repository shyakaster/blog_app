require 'rails_helper'

RSpec.feature "Creating articles" do
  before do
    @john = User.create!(email: "shyakaster@gmail.com", password:"password")
    login_as(@john)
  end
  scenario "A user creates a new article" do
    visit "/"
    click_link "New article"
    fill_in "Title", with:"Creating first article"
    fill_in "Body", with: "Lorem ipsum"
    click_button "Create Article"

    expect(page).to have_content("Article has been created")
    expect(page.current_path).to eq(articles_path)
    expect(page).to have_content("Created by: #{@john.email}")

  end
  scenario "Creating a failing article" do
    visit "/"
    click_link "New article"
    fill_in "Title", with:""
    fill_in "Body", with: ""
    click_button "Create Article"

    expect(page).to have_content("Sorry article not saved")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
  end
end