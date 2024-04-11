class Account < ApplicationRecord
  has_many :contacts, dependent: :destroy
  has_many :imports,  dependent: :destroy
end
