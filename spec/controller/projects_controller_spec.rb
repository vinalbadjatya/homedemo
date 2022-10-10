require 'rails_helper'
# describe ProjectsController, type: :controller do
#   it "returns the List of projects" do 
#     get :index
#     expect(response).to render_template("index")
#     end
# end

describe "Projects" do
  describe "GET projects#index" do
    context "when the user is an employee" do
      it "should list project_name of all projects"
    end

    context "when the user is  an admin" do
      it "should list project_name of users own projects" 
    end
  end
end

# describe "GET projects#index" do
#   context "when the user is an admin" do
#     it "should list titles of all stories" do
#       admin = create(:admin)
#       stories = create_list( user: admin)
#       login_as(admin, scope: :user)
#       visit projects_path
#     end
#   end
# end
