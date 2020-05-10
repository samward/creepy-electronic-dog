require "rails_helper"

RSpec.feature "Viewing artcles", type: :feature do
  let(:articles)  { create_list(:article, 2) }

  before do
    allow(ArticlesService).to receive(:call).and_return(articles)
  end

  scenario "A user views the articles list" do
    visit "/articles"

    expect(page).to have_selector(".article", count: 2)
  end
end
