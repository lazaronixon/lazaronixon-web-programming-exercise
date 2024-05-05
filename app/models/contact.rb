class Contact < ApplicationRecord
  belongs_to :account
  belongs_to :import, optional: true

  def name
    super || email_address
  end
end
