class Page < ActiveRecord::Base
  chooses_templates :page_templates, :styles
end
