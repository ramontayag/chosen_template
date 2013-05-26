class PageTemplate < ActiveRecord::Base
  belongs_to :page
  choosable_template by: :page
end
