class CreateStyles < ActiveRecord::Migration
  def up
    create_table :styles do |t|
      t.string :name
      t.references :page
      t.datetime :template_published_at
      t.datetime :template_previewed_at
      t.timestamps
    end
  end

  def down
    drop_table :styles
  end
end
