class Account < ApplicationRecord
  has_many :contacts, dependent: :destroy
end
