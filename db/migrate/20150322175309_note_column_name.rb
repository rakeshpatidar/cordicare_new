class NoteColumnName < ActiveRecord::Migration
  def change
  	rename_column :notes, :id, :note_msg_id
  end
end
