class CreateTutors < ActiveRecord::Migration[6.1]
  def change
    create_table :tutors do |t|
      t.string :name
      t.references :course, index: true
      t.timestamps
    end
  end
end
