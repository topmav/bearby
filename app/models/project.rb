class Project < ApplicationRecord
    # Associations
    belongs_to :agency
    belongs_to :industry, optional: true
    has_many :project_services, dependent: :destroy
    has_many :services, through: :project_services
  
    has_many_attached :media

    validates :title, presence: true
    scope :ordered, -> { order(created_at: :desc) }
  
  end