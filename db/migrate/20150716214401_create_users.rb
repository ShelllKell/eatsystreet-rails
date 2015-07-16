class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :x_bowtie_user_id
      t.string :cuisine_preference
    end
  end
end
