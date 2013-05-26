module ChosenTemplate
  module Chooser

    extend ActiveSupport::Concern

    included do

      self.template_choices.each do |template_choice|
        [:previewed, :published].each do |action_type|
          method_name = :"#{action_type}_#{template_choice.to_s.singularize}"
          define_method(method_name) do
            order_scope_name = :"by_template_#{action_type}_at"
            self.send(template_choice).send(order_scope_name).first
          end
        end
      end

    end

  end
end
