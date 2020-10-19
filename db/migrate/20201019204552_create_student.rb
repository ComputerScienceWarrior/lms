class CreateStudent < ActiveRecord::Migration
  def change
    create_table :students do |u|
      u.string :firstname
      u.string :lastname
      u.string :username
      u.string :password_digest
    end
  end
end
