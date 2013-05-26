require 'active_support/concern'
require 'active_support/core_ext/class'
require 'active_support/inflector'
require "chosen_template/version"
require 'chosen_template/chooser'
require 'chosen_template/chosen'

module ChosenTemplate

  extend ActiveSupport::Concern

  module ClassMethods
    def chooses_templates(*template_choices)
      cattr_accessor :template_choices
      self.template_choices = template_choices
      include Chooser
    end

    def choosable_template(options={})
      cattr_accessor :chosen_by
      self.chosen_by = options[:by]
      include Chosen
    end
  end

end

ActiveRecord::Base.send :include, ChosenTemplate
