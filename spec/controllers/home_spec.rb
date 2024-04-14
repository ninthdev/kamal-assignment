require 'rails_helper'


RSpec.describe HomeController, type: :controller do
  describe "GET #index" do
    it "responds with HTML format" do
      get :index
      expect(response).to be_successful
      expect(response.content_type).to eq("text/html; charset=utf-8")
    end

    it "responds with PDF format when requested" do
      get :index, params: { format: :pdf }
      expect(response).to be_successful
      expect(response.content_type).to eq("application/pdf")
    end

    it "renders the HTML template by default" do
      get :index
      expect(response).to render_template("index")
    end

    it "renders the PDF template when requested" do
      get :index, params: { format: :pdf }
      expect(response).to render_template("index")
    end

    it "renders the PDF layout when requested" do
      get :index, params: { format: :pdf }
      expect(response).to render_template(layout: "layouts/application")
    end

  end
end
