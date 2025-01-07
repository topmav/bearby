# app/models/agency_service.rb
class AgencyService < ApplicationRecord
    belongs_to :agency
    belongs_to :service
  end