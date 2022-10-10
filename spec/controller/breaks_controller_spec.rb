  # require 'rails_helper'
# describe BreaksController, type: :controller do
#   describe "GET index" do
#     it “returns a successful response” do
#       get :index
#       expect(bk).to be_successful
#     end
#   end
# end

# describe BreaksController, type: :controller do
#   it " return " do
#   get :index
#  expect(response).to render_template("index")
#   end
#  end

# RSpec.describe BreaksController, :type => :controller do
#   describe "GET index" do
#     it "has a 200 status code" do
#       get :index
#       expect(response.status).to eq(200)
#     end
#   end
# end

# class BreaksController <  ActionController::TestCase
#   test "index action should be sucess" do
#     get :index
#     assert_response :success
#   end
# end

# RSpec.describe BreaksController, :type => :controller do
#   describe "responds to" do
#     it "responds to html by default" do
#       post :create, :params {day: 1 reason: "nil"}
#       expect(response.content_type).to eq "text/html"
#     end

#     it "responds to custom formats when provided in the params" do
#       post :create, :params {day: 1 reason: "nil"}
#       expect(response.content_type).to eq "application/json"
#     end
#   end
# end