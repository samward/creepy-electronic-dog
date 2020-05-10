require 'rails_helper'

describe "ArticlesService" do
  let(:uri) { URI("https://s3-eu-west-1.amazonaws.com/olio-staging-images/developer/test-articles-v2.json") }
  let(:initial_data) { File.read("spec/fixtures/initial_data.json") }

  before do
    allow(Net::HTTP).to receive(:get).with(uri).and_return(initial_data)
  end

  describe ".call" do
    subject { ArticlesService.call }

    it "requests the article list from the endpoint" do
      expect(Net::HTTP).to receive(:get).with(uri)

      subject
    end

    it "returns a collection of articles" do
      expect(subject).to all be_a Article
    end

    it "assigns the current data to the articles" do
      expect(subject.first.raw_json).to be_present
    end

    context "when the endpoint returns valid data" do
      it "requests parses the data and creates the expected articles" do
        expect{ subject }.to change{ Article.count }.by(2)
      end

      context "when the same articles are returned in later requests" do
        before do
          subject
        end

        it "doesn't create any additional articles" do
          expect{ subject }.to_not change{ Article.count }
        end
      end

      context "when one or more of the articles are no longer served by the endpoint" do
        before do
          create_list(:article, 10)
        end

        it "only returns the articles which are still served" do
          expect(subject.count).to eq 2
        end
      end
    end
  end
end
