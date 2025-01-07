class Project < ApplicationRecord
    # Associations
    belongs_to :agency
    belongs_to :industry, optional: true
  
    has_many_attached :media
  
  end