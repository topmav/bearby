module Admin
    class AgenciesController < ApplicationController
      def index
        @agencies = Agency.includes(:projects).all
      end
  
      def show
        @agency = Agency.find(params[:id])
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
      end
  
      def update
        @agency = Agency.find(params[:id])
        if @agency.update(agency_params)
          redirect_to admin_agency_path(@agency), notice: "Agency updated successfully."
        else
          render :edit, status: :unprocessable_entity
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
          :logo
        )
      end
    end
  end