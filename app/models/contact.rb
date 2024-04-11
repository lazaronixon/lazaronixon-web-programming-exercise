class Contact < ApplicationRecord
  belongs_to :account

  def name
    super || email_address
  end
end
