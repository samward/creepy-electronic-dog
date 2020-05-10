require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:article) { create(:article, :creepy_electronic_dog, external_id: 1131673) }
  let(:json) { JSON.parse(File.read("spec/fixtures/creepy_electronic_dog.json")) }

  describe ".find_or_create_from_json" do
    subject { Article.find_or_create_from_json(json) }

    context "when the article already exists" do
      before do
        article
      end

      it "does not create a new article" do
        expect { subject }.to_not change { Article.count }
      end
    end

    context "when the article does not exist" do
      it "creates a new article" do
        expect { subject }.to change { Article.count }.by 1
      end
    end
  end

  describe "#title" do
    subject { article.title }
    it "returns the title from the json data" do
      expect(subject).to eq "Creepy electronic dog"
    end
  end

  describe "#external_likes_count" do
    subject { article.external_likes_count }
    it "returns the likes count from the json data" do
      expect(subject).to eq 99
    end
  end

  describe "#image_src" do
    subject { article.image_src }
    it "returns the medium image url from the json data" do
      expect(subject).to eq "https://cdn.olioex.com/uploads/photo/file/0yU2O_8xEFAoMGe9VFCFrQ/medium_image.jpg"
    end
  end

  describe "#description" do
    subject { article.description }
    it "returns the description from the json data" do
      expect(subject).to eq "Creepy electronic dog. Ideal for someone who wants a dog that is both electronic and creepy."
    end
  end

  describe "#likes_count" do
    subject { article.likes_count }

    context "when there are no local likes" do
      it "returns the endpoint's likes count" do
        expect(subject).to eq 99
      end
    end

    context "when the are local likes" do
      before do
        article.like!
      end

      it "returns the endpoint's like count plus the local likes count" do
        expect(subject).to eq 100
      end
    end
  end

  describe "#like!" do
    subject { article.like! }

    it "creates a new like" do
      expect { subject }.to change { article.likes.count }.by 1
    end
  end
end
