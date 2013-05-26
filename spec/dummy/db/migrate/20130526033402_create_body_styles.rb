class CreateBodyStyles < ActiveRecord::Migration
  def up
    create_table :body_styles do |t|
      t.string :name
      t.datetime :template_published_at
      t.datetime :template_previewed_at
      t.timestamps
    end
  end

  def down
    drop_table :body_styles
  end
end
