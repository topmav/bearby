module Admin
    class AgenciesController < ApplicationController
      def index
        @agencies = Agency.includes(:projects)
                         .with_attached_logo
                         .all
      end
  
      def show
        @agency = Agency.with_attached_logo.find(params[:id])
      end
  
      def new
        @agency = Agency.new
      end
  
      def create
        @agency = Agency.new(agency_params)
        if @agency.save
          redirect_to admin_agency_path(@agency), notice: "Agency created successfully."
        else
          render :new, status: :unprocessable_entity
        end
      end
  
      def edit
        @agency = Agency.find(params[:id])
        response.headers["Cache-Control"] = "no-cache, no-store"
        response.headers["Pragma"] = "no-cache"
        response.headers["Expires"] = "Mon, 01 Jan 1990 00:00:00 GMT"
      end
  
      def update
        @agency = Agency.find(params[:id])
        if @agency.update(agency_params)
          redirect_to admin_agency_path(@agency), notice: "Agency updated successfully."
        else
          render :edit, status: :unprocessable_entity
        end
      end
  
      def destroy
        @agency = Agency.find(params[:id])
        @agency.destroy
        
        redirect_to admin_agencies_path, notice: "Agency was successfully deleted."
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