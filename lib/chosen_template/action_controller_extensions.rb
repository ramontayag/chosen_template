module ChosenTemplate
  module ActionControllerExtensions

    extend ActiveSupport::Concern

    def choosable_templates
      include ChosenTemplate::ChoosableTemplateController
    end

  end
end

ActionController::Base.extend ChosenTemplate::ActionControllerExtensions
