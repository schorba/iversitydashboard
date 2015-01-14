class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :course_id, null: false
      t.string :title
      t.string :subtitle
      t.string :state
      t.text :image
      t.text :description
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end

    add_index :courses, :course_id
  end
end

