class CreateVoicemsgs < ActiveRecord::Migration
  def change
    create_table :voicemsgs do |t|
      t.integer :physician
      t.integer :patient_id
      t.attachment :voice

      t.timestamps null: false
    end
  end
end
