class CreateStudent < ActiveRecord::Migration
  def change
    create_table :students do |s|
      s.string :firstname
      s.string :lastname
      s.string :username
      s.string :password_digest
    end
  end
end