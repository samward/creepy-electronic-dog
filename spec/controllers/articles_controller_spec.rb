require "rails_helper"

RSpec.describe ArticlesController do
  describe "GET index" do
    let(:articles) { create_list(:article, 3) }
    before do
      allow(ArticlesService).to receive(:call).and_return(articles)
    end

    it "calls the ArticlesService" do
      expect(ArticlesService).to receive(:call).once
      get :index
    end

    it "assigns all Articles to @articles" do
      get :index
      expect(assigns(:articles).length).to eq(3)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "PATCH #like" do
    let(:article) { create(:article) }
    subject { patch :like, format: :js, params: { id: article.id } }

    it "calls like on the found Article" do
      expect_any_instance_of(Article).to receive(:like!).once
      subject
    end

    it "renders the like template" do
      subject
      expect(response).to render_template("like")
    end
  end
end
