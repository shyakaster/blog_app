require "rails_helper"

RSpec.feature "Creating articles" do
  before do
    @article1=Article.create(title: "Testing first article list", body: "This is the body of the article")
    @article2=Article.create(title: "Testing second article list", body: "This is the body of the article")
  end
  scenario "Listing articles" do
    visit "/"
    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article1.body)
    expect(page).to have_content(@article2.title)
    expect(page).to have_content(@article2.body)
    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article2.title)
    expect(page).not_to have_link("New article")

  end

end