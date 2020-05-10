require "rails_helper"

RSpec.describe ArticlesController do
  describe "GET index" do
    before do
      create_list(:article, 3)
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
