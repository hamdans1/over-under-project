class SheetsController < ApplicationController
    before_action :require_sign_in, except: :show
    before_action :authorize_user, except: [:show, :new, :create]
    
    def show
        @sheet = Sheet.find(params[:id])
    end
    
    def new
        @sheet = Sheet.new
    end
    
    def edit
        @sheet = Sheet.find(params[:id])
    end
    
    def create
        @sheet = Sheet.new(sheet_params)
        @sheet.user = current_user
        
        if @sheet.save
            flash[:notice]= "Your sheet was saved"
            redirect_to sheets_path
        else
            flash[:alert] = "There was an error saving your sheet"
            render :new
        end
    end
    
    def update
        @sheet = Sheet.find(params[:id])
        @sheet.assign_attributes(sheet_params)
        
        if @sheet.save
            flash[:notice] = "Your sheet has been updated"
            redirect_to sheets_path
        else
            flash[:alert] = "There was an error saving your sheet"
            render :edit
        end
    end
    
    def destroy
        @sheet = Sheet.find(params[:id])
        
        if @sheet.destroy
            flash[:notice] = "\"#{@sheet.name}\" was deleted successfully."
            redirect_to sheets_path
        else
            flash.now[:alert] = "There was an error deleting your sheet."
            render :show
        end
    end
    
    private
    
    def sheet_params
        params.require(:sheet).permit(:name)
    end
    
end