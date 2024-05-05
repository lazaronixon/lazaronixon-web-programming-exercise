class AddImportIdToContacts < ActiveRecord::Migration[7.1]
  def change
    add_reference :contacts, :import, null: true, foreign_key: true
  end
end
