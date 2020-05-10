require "rails_helper"

RSpec.describe ArticlesController do
  describe "GET index" do
    let(:articles)  { create_list(:article, 3) }
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
end
