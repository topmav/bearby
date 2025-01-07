class Service < ApplicationRecord

    # Associations
    has_many :agency_services, dependent: :destroy
    has_many :agencies, through: :agency_services


end