module Admin
  class AgenciesController < ApplicationController
    def index
      @agencies = Agency.includes(:projects)
                        .with_attached_logo
                        .all
    end

    # Replaces 'show' with a tab-based edit interface
    def show
      @agency = Agency.with_attached_logo.find(params[:id])
      render :edit_tab
    end

    # Old edit now redirects
    def edit
      redirect_to admin_agency_path(params[:id])
    end

    def update
      @agency = Agency.find(params[:id])
      if @agency.update(agency_params)
        flash[:notice] = "Agency updated successfully."
      else
        flash[:alert] = "Error updating agency. See form for details."
      end
      # Re-render same tab
      render :edit_tab
    end

    # Placeholder actions for the new tabs
    def projects
      @agency = Agency.find(params[:id])
      render :projects
    end

    def leads
      @agency = Agency.find(params[:id])
      render :leads
    end

    def subscription
      @agency = Agency.find(params[:id])
      render :subscription
    end

    def new
      @agency = Agency.new
    end

    def create
      @agency = Agency.new(agency_params)
      if @agency.save
        flash[:notice] = "Agency created successfully."
        redirect_to admin_agency_path(@agency)
      else
        flash[:alert] = "Error creating agency. See form for details."
        render :new
      end
    end

    private

    def agency_params
      params.require(:agency).permit(
        :name,
        :address,
        :city,
        :state,
        :zip_code,
        :company_size,
        :in_business,
        :full_service_agency,
        :phone,
        :website,
        :description,
        :lat,
        :long,
        :logo,
        service_ids: []
      )
    end
  end
end