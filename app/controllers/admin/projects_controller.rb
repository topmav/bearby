module Admin
    class ProjectsController < ApplicationController
      def destroy
        @agency = Agency.find_by!(uuid: params[:agency_id])
        @project = @agency.projects.find(params[:id])
        @project.destroy
        flash[:notice] = "Project was successfully deleted."
        redirect_to projects_admin_agency_path(@agency)
      end
    end
  end