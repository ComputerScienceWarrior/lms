class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.text :title
      t.text :subject
      t.integer :points_value
      t.text :type
      t.integer :grade_level
      t.integer :course_id

      t.timestamps
    end

    add_index :tests, :course_id
    add_foreign_key :tests, :courses, column: :course_id, on_delete: :cascade
  end
end
