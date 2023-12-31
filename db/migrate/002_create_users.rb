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
      t.integer :course_id

      t.timestamps
    end

    add_index :users, :course_id
    add_foreign_key :users, :courses, column: :course_id, on_delete: :restrict
  end
end
