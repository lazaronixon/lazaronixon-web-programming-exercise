class AddEmailAddressIndexToContacts < ActiveRecord::Migration[7.1]
  def change
    add_index :contacts, [:account_id, :email_address], unique: true
  end
end
