class BugsController < ApplicationController
   before_action :set_author
   before_action :set_author_bug, only: [:show, :update, :destroy]
     
   # GET /authors/:author_id/bugs
   def index
     json_response(@author.bugs)
   end
     
   # GET /authors/:author_id/bugs/:id
   def show
     json_response(@bug)
   end
     
   # POST /authors/:author_id/bugs
   def create
     @author.bugs.create!(bug_params)
     json_response(@author, :created)
   end
     
   # PUT /authors/:author_id/bugs/:id
   def update
     @bug.update(bug_params)
     head :no_content
   end
     
   # DELETE /authors/:author_id/bugs/:id
   def destroy
     @bug.destroy
     head :no_content
   end
     
   private
     
   def bug_params
     params.permit(:title, :description, :issueType, :priority, :status)
   end
     
   def set_author
     @author = Author.find(params[:author_id])
   end
     
   def set_author_bug
     @bug = @author.bugs.find_by!(id: params[:id]) if @author
   end
end
