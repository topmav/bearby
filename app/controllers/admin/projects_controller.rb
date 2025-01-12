module Admin
  class ProjectsController < ApplicationController
    before_action :set_agency

    def new
      @project = Project.new
    end

    def create
      @project = @agency.projects.build(project_params)
      if @project.save
        respond_to do |format|
          format.html { redirect_to projects_admin_agency_path(@agency) }
          format.turbo_stream
        end
      else
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      @project = Project.find(params[:id])
      @project.destroy
      flash[:notice] = "Project was successfully deleted."
      redirect_to projects_admin_agency_path(@project.agency)
    end

  private

    def set_agency
      @agency = Agency.find_by!(uuid: params[:agency_id])
    end

    def project_params
      params.require(:project).permit(
        :title,
        :client,
        :description,
        :anonymize_client,
        :anonymous_client_name,
        :industry_id,
        :outcome,
        :published,
        service_ids: []
      )
    end
  end
end