require 'rails_helper'
describe BreaksController, type: :controller do
  describe "GET index" do
    it “returns a successful response” do
      get :index
      expect(bk).to be_successful
    end
  end
end