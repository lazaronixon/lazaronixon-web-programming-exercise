class CreateImports < ActiveRecord::Migration[7.1]
  def change
    create_table :imports do |t|
      t.references :account
      t.string :status, default: "processing", null: false
      t.timestamps
    end
  end
end
