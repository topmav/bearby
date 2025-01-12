module Admin
  class AgenciesController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_admin, only: [:index]
    before_action :ensure_user_agency_match, only: [:show, :edit, :update, :projects, :leads, :subscription]

    def index
      @agencies = Agency.includes(:projects).with_attached_logo.all
    end

    # Replaces 'show' with a tab-based edit interface
    def show
      @agency = Agency.with_attached_logo.find_by!(uuid: params[:id])
      render :edit_tab
    end

    def edit
      redirect_to admin_agency_path(params[:id])
    end

    def update
      @agency = Agency.find_by!(uuid: params[:id])
      if @agency.update(agency_params)
        flash[:notice] = "Agency info updated successfully."
        redirect_to edit_admin_agency_path(@agency)
      else
        render :edit_tab, status: :unprocessable_entity
      end
    end

    # Placeholder actions
    def projects
      @agency = Agency.find_by!(uuid: params[:id])
      @projects = @agency.projects.order(updated_at: :desc)
      render :projects
    end

    def leads
      @agency = Agency.find_by!(uuid: params[:id])
      render :leads
    end

    def subscription
      @agency = Agency.find_by!(uuid: params[:id])
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

    def ensure_user_agency_match
      return if current_user.admin?  # Admin can access any agency
      if current_user.agency.nil? || current_user.agency.uuid != params[:id]
        raise ActiveRecord::RecordNotFound
      end
    end

    def ensure_admin
      unless current_user.admin?
        redirect_to admin_agency_path(current_user.agency.uuid), alert: "You are not authorized to view that page."
      end
    end
  end
end