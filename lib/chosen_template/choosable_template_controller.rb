module ChosenTemplate
  module ChoosableTemplateController

    def preview_template
      template = template_model_class.find(params[:id])
      template.update_attributes(template_previewed_at: Time.now)
      respond_with template, params.slice(:location)
    end

    def publish_template
      template = template_model_class.find(params[:id])
      template.update_attributes(template_published_at: Time.now)
      respond_with template, params.slice(:location)
    end

    protected

    def template_model_class
      @template_model_class ||= self.controller_name.classify.constantize
    end

  end
end
