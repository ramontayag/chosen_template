module ChosenTemplate
  module Chooser

    extend ActiveSupport::Concern

    included do

      self.template_choices.each do |template_choice|
        [:previewed, :published].each do |action_type|
          method_name = :"#{action_type}_#{template_choice.to_s.singularize}"
          define_method(method_name) do
            order_scope_name = :"by_template_#{action_type}_at"
            template_class = template_choice.to_s.classify.constantize
            foreign_key = "#{self.class.name.underscore}_id"
            template_scope = if template_class.column_names.include?(foreign_key)
                               self.send(template_choice)
                             else
                               template_class.all
                             end
            template_scope.send(order_scope_name).first
          end
        end
      end

    end

  end
end
