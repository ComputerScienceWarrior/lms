class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.text :title
      t.text :subject
      t.integer :points_value
      t.text :type
      t.integer :grade_level

      t.timestamps
    end
  end
end
