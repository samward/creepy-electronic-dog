require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:article) { create(:article, :creepy_electronic_dog) }

  describe "#title" do
    subject { article.title }
    it "returns the title from the json data" do
      expect(subject).to eq "Creepy electronic dog"
    end
  end
end
