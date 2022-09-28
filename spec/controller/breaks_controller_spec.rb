require 'rails_helper'
RSpec.describe BreaksController do
  describe "GET index" do
    it "renders the index template " do
      bk = Break.create
      get :index
      expect(response).to render_template("index")
    end
  end
end
