module ChosenTemplate
  module Chosen

    extend ActiveSupport::Concern

    included do
      scope :published_templates, -> {
        where("#{self.table_name}.template_published_at IS NOT NULL")
      }
      scope :by_template_published_at, -> {
        published_templates.order("#{self.table_name}.template_published_at DESC")
      }
      scope :previewed_templates, -> {
        where("#{self.table_name}.template_previewed_at IS NOT NULL")
      }
      scope :by_template_previewed_at, -> {
        previewed_templates.order("#{self.table_name}.template_previewed_at DESC")
      }
    end

    def previewed_template?
      self.class.by_template_previewed_at.first == self
    end

    def preview_template!
      self.update_attributes template_previewed_at: Time.now
    end

    def published_template?
      self.class.by_template_published_at.first == self
    end

    def publish_template!
      self.update_attributes template_published_at: Time.now
    end

  end
end
