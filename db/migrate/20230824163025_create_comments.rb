class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :paragraph
      t.belongs_to :blog
      t.timestamps
    end
  end
end
