# app/models/project_service.rb
class ProjectService < ApplicationRecord
    belongs_to :project
    belongs_to :service
  end