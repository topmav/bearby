class Industry < ApplicationRecord
    has_many :projects, dependent: :nullify
end