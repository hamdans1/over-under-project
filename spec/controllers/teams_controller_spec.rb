require 'rails_helper'
require 'faker'

RSpec.describe TeamsController, type: :controller do
    let(:my_team) {Team.create!(name: Faker::Team.state, total: Faker::Number.between(10,60), city: Faker::Team.name, players: Faker::HarryPotter.character, coach: Faker::GameOfThrones.character, league: 'NFL')}
    
    context "guest" do
        
        describe "GET index" do
            
            it "returns http success" do
                get :index
                expect(response).to have_http_status(:success)
            end
            
            it "assigns Team.all to team" do
                get :index
                expect(assigns(:teams)).to eq([my_team])
            end
        end
        
        describe "GET show" do
            
            it "returns http success" do
                get :show, {id: my_team.id}
                expect(response).to have_http_status(:success)
            end
            
            it "renders the #show view" do
                get :show, {id:my_team.id}
                expect(response).to render_template :show
            end
            
            it "assigns my_team to @team" do
                get :show, {id: my_team.id}
                expect(assigns(:team)).to eq(my_team)
            end
            
        end
        
    end
    
    context "admin" do
        before do
            @user = User.create!(email: 'tester@spectest.com', password: 'password', role: :admin)
            sign_in @user
        end
        
        describe "GET new" do
            
            it "returns http success" do
                get :new
                expect(response).to have_http_status(:success)
            end
            
            it "renders the #new view" do
                get :new
                expect(response).to render_template(:new)
            end
        
            it "initializes @team" do
                get :new
                expect(assigns(:team)).not_to be_nil
            end
            
        end
        
    end
            
end
