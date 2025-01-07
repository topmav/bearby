class Agency < ApplicationRecord

    # Associations
    has_many :agency_services, dependent: :destroy
    has_many :services, through: :agency_services
    has_many :projects, dependent: :destroy


    has_one_attached :logo
  
    # Add company size enums
  
    # Validations
    validates :name,
              presence: true,
              length:   { minimum: 3 }
  
    validate :website_must_be_valid, if: -> { website.present? }
  
    # We’ll remove "http(s)://" and "www." from the website to store only the domain.
    before_validation :normalize_website, if: -> { website.present? }
  
  
    private
  
    def website_must_be_valid
      # We’ll parse it as a full URL or domain. 
      # If parsing fails, we add an error.
      parsed_uri = begin
        # If user typed “example.com” we can temporarily prepend "http://" to parse
        URI.parse(website[/\Ahttps?:\/\//] ? website : "http://#{website}")
      rescue URI::InvalidURIError
        nil
      end
  
      if parsed_uri.nil? || parsed_uri.host.blank?
        errors.add(:website, "must be a valid URL or domain")
      end
    end
  
    def normalize_website
      # Attempt to parse domain
      uri = URI.parse(website[/\Ahttps?:\/\//] ? website : "http://#{website}")
      # Remove leading 'www.' if present
      domain_only = uri.host.sub(/\Awww\./i, "")
      self.website = domain_only
    rescue URI::InvalidURIError
      # If invalid, set to nil (the validation above will catch it).
      self.website = nil
    end
  end