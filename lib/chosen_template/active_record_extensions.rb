module ChosenTemplate
  module ActiveRecordExtensions

    CHOOSABLE_REQUIRED_COLUMNS = [:template_published_at, :template_previewed_at]
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

        CHOOSABLE_REQUIRED_COLUMNS.each do |column_name|
          unless self.column_names.include?(column_name.to_s)
            raise ArgumentError, "`#{self.table_name}` requires the `#{column_name}` column"
          end
        end
        include Chosen
      end
    end

  end
end

ActiveRecord::Base.send :include, ChosenTemplate::ActiveRecordExtensions
