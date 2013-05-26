class CreatePageTemplates < ActiveRecord::Migration
  def up
    create_table :page_templates do |t|
      t.string :name
      t.references :page
      t.datetime :template_published_at
      t.datetime :template_previewed_at
      t.timestamps
    end
  end

  def down
  end
end
