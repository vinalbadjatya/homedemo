#  require 'rails_helper'
# describe HolidaysController, type: :controller do

#   it "return holidays" do
  
#     get :index
#     expect(response).to render_template("index")
#   end
# end

context "when the user is logged in" do
    it "should render holidays#index"
  end

  context "when the user is logged out" do
    it "should redirect to the login page"
  end