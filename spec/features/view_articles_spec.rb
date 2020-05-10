require "rails_helper"

RSpec.feature "Viewing artcles", type: :feature do
  before do
    FactoryBot.create_list(:article, 2)
  end

  scenario "A user views the articles list" do
    visit "/articles"

    click_button "Create Widget"

    expect(page).to have_selector(".article", count: 2)
  end
end
