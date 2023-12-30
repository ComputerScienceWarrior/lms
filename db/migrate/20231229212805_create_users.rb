class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.text :first_name
      t.text :last_name
      t.text :username
      t.text :password_digest
      t.text :email
      t.integer :age
      t.integer :grade_level
      t.decimal :gpa

      t.timestamps
    end
  end
end
