class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.references :account
      t.string :name, limit: 2048
      t.string :email_address, limit: 750, null: false

      t.timestamps
    end
  end
end
