class TeamsController < ApplicationController
    
    before_action :authorize_user, except: [:index, :show]
    
    def index
        @teams = Team.all
    end
    
    def show
        @team = Team.find(params[:id])
    end
    
    def new
        @team = Team.new
    end
    
    def create
        @team = Team.new(team_params)
        
        if @team.save
            redirect_to @team, notice: "Team has been saved"
        else
            flash.now[:alert] = "Error saving team. Please try again."
            render :new
        end
    end
    
    def edit
        @team = Team.find(params[:id])
    end
    
    def update
        @team = Team.find(params[:id])
        
        @team.assign_attributes(team_params)
        
        if @team.save
            flash[:notice] = "Team has been updated"
            redirect_to @team
        else
            flash.now[:alert] = "Error saving team. Please try again."
            render :edit
        end
    end
    
    def destroy
        @team = Team.find(params[:id])
        
        if @team.destroy
            flash[:notice] = "\"#{@team.name}\" has been deleted successfully."
            redirect_to action: :index
        else
            flash.now[:alert] = "There was an error deleting the team."
            render :show
        end
    end
    
    private
    
    def team_params
        params.require(:team).permit(:name, :total, :league, :coach, :over, :players)
    end
    
    def authorize_user
        unless current_user.admin?
            flash[:alert] = "You must be an admin to do that."
            redirect_to teams_path
        end
    end
    
end
