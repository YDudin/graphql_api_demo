class CreateModels < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :login_name, null: false
      t.string :first_name, null: false
      t.string :last_name,  null: false
      t.string :type,       null: false
      t.string :role,       null: false
      t.boolean :active,    null: false, default: true

      t.string :company_name, null: true
      t.string :email,        null: true
      t.string :phone,        null: true

      t.timestamps
    end

    create_table :transactions do |t|
      t.string  :unique_id, null: false
      t.integer :amount,    null: false
      t.string  :currency,  null: false
      t.string  :status,    null: false

      t.references :user, index: true
      t.timestamps
    end

    add_foreign_key :transactions, :users, on_delete: :cascade
  end
end
