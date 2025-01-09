class Agency < ApplicationRecord

    # Associations
    has_many :agency_services, dependent: :destroy
    has_many :services, through: :agency_services
    has_many :projects, dependent: :destroy


    has_one_attached :logo, dependent: :purge_later
  
    COMPANY_SIZES = ["Very small", "Small", "Medium", "Large", "Very large"].freeze
    
    STATES = [
      'AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'FL', 'GA',
      'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD',
      'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ',
      'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC',
      'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY'
    ].freeze
  
    # Validations
    validates :name,
              presence: true,
              length:   { minimum: 3 }
  
    validates :company_size, inclusion: { in: COMPANY_SIZES, allow_blank: true }
    validates :zip_code, length: { is: 5, allow_blank: true }
    validates :state, inclusion: { in: STATES, allow_blank: true }
  
  
    # Callbacks
    before_validation :clean_phone_number, if: -> { phone.present? }
    before_validation :clean_zip_code, if: -> { zip_code.present? }
  
  
    private
  
    def clean_phone_number
      # Remove everything except digits
      self.phone = phone.gsub(/\D/, '')
      
      # Ensure it's exactly 10 digits
      unless phone.length == 10
        errors.add(:phone, "must be exactly 10 digits")
        self.phone = nil
      end
    end

    def clean_zip_code
      # Remove everything except digits
      self.zip_code = zip_code.gsub(/\D/, '')
      
      # Ensure it's exactly 5 digits
      unless zip_code.length == 5
        errors.add(:zip_code, "must be exactly 5 digits")
        self.zip_code = nil
      end
    end

  end