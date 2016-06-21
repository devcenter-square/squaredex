class CreateKarmaRequests < ActiveRecord::Migration
  def change
    create_table :karma_requests do |t|
      t.string :reason, null: false
      t.string :from, null: false
      t.string :to, null: false
      t.integer :project_id, null: false
      t.boolean :approved, default: false
      t.integer :karma

      t.timestamps null: false
    end
  end
end
