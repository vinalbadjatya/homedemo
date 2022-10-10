require 'rails_helper'
# describe BreaksController, type: :controller do
#   describe "GET index" do
#     it “returns a successful response” do
#       get :index
#       expect(bk).to be_successful
#     end
#   end
# end

RSpec.describe "breaks", type: :request do
  get user_path(@user)
   
  post breaks_path, break: {day: 2, reason: "nil"}

  expect(response.body).to include 'break applied'
  expect(response).to have_http_status(200)
end