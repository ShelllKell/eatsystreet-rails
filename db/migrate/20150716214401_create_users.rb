class CreateUsers < ActiveRecord::Migration
  def change
    create_table :user_preferences do |t|
      t.string :bowtie_user_id
      t.string :cuisine_preference
    end
    add_index :user_preferences, :bowtie_user_id
  end
end
