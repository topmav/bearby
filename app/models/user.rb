class User < ApplicationRecord
    # If you want to allow user.agency to be nil:
    belongs_to :agency, optional: true
  
    # Devise modules
    devise :database_authenticatable, :recoverable
  
    # If is_active == false, user cannot sign in.
    def active_for_authentication?
      super && is_active?
    end
  
    # Indicate whether user is admin
    # (Database default is false, so newly created users are not admin by default.)
    def admin?
      self.admin
    end
  end