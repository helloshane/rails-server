class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :user_from
      t.integer :user_to
      t.string :content
      t.timestamps
    end
  end
end
