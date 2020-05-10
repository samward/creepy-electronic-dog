require "rails_helper"

RSpec.feature "Liking artcles", type: :feature, js: true do
  let(:articles) { [create(:article, :creepy_electronic_dog)] }

  before do
    allow(ArticlesService).to receive(:call).and_return(articles)
  end

  scenario "A likes an article" do
    visit "/articles"

    first(".article") do
      click_on "99"
    end

    expect(page).to have_button 'Liked!'
  end
end
