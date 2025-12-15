class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email_address, null: false
      t.string :password_digest, null: false
      t.string :username, null: false, default: ''
      t.string :artistic_name, null: false, default: ''
      t.string :composer_name, null: false, default: ''

      t.timestamps
    end
    add_index :users, "LOWER(email_address)", unique: true, name: "index_users_on_lower_email_address"
    add_index :users, "LOWER(username)", unique: true, name: "index_users_on_lower_username"
    add_index :users, :artistic_name
    add_index :users, :composer_name
  end
end
