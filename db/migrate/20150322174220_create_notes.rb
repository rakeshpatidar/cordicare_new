class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :text_msg
      t.integer :physician
      t.references :patient, index: true

      t.timestamps null: false
    end
    add_foreign_key :notes, :patients
  end
end
