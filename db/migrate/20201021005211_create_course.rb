class CreateCourse < ActiveRecord::Migration
  def change
    create_table :courses do |c|
      c.string :title
      c.text :cirriculum
      c.boolean :completed?
      c.integer :student_id #foreign key linking to students table
    end
  end
end
