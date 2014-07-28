class FoundationFormBuilder < ActionView::Helpers::FormBuilder
	delegate :content_tag, to: :@template
	delegate :label_tag, to: :@template

	def text_field(method, *args)
		field_errors = object.errors[method].join(', ') unless object.errors[method].blank?
		options = args.extract_options!.symbolize_keys!
		options[:label] ||= "#{method.to_s}".humanize
		options[:class] ||= ""
		options[:class] << "error" if field_errors
		options.delete(:object)

		label = lambda do
			label_tag("#{@object_name}[#{method}]", "#{options[:label]}", class: "#{'error' if field_errors}") do
				label = "#{options[:label]}"
				options.delete(:label)
				label << super(method, options)
				# The below does not work correctly - see nil (cannot get name). Could substitute method in, but
				# this will not allow for refactoring (text_area_tag, text_field_tag, etc)
				# label << @template.send('text_field_tag', "#{@object_name}[#{method}]", nil, options)

				label.html_safe
			end
		end

		error_messages = lambda do
			content_tag(:small, field_errors.humanize, class: "error") if field_errors
		end

		"#{label.call} #{error_messages.call}".html_safe
	end

	def text_area(method, *args)
		field_errors = object.errors[method].join(', ') unless object.errors[method].blank?
		options = args.extract_options!.symbolize_keys!
		options[:label] ||= "#{method.to_s}".humanize
		options[:class] ||= ""
		options[:class] << "error" if field_errors
		options.delete(:object)

		label = lambda do
			label_tag("#{@object_name}[#{method}]", "#{options[:label]}", class: "#{'error' if field_errors}") do
				label = "#{options[:label]}"
				options.delete(:label)
				label << super(method, options)

				label.html_safe
			end
		end

		error_messages = lambda do
			content_tag(:small, field_errors.humanize, class: "error") if field_errors
		end

		"#{label.call} #{error_messages.call}".html_safe
	end

	def password_field(method, *args)
		field_errors = object.errors[method].join(', ') unless object.errors[method].blank?
		options = args.extract_options!.symbolize_keys!
		options[:label] ||= "#{method.to_s}".humanize
		options[:class] ||= ""
		options[:class] << "error" if field_errors
		options.delete(:object)

		label = lambda do
			label_tag("#{@object_name}[#{method}]", "#{options[:label]}", class: "#{'error' if field_errors}") do
				label = "#{options[:label]}"
				options.delete(:label)
				label << super(method, options)

				label.html_safe
			end
		end

		error_messages = lambda do
			content_tag(:small, field_errors.humanize, class: "error") if field_errors
		end

		"#{label.call} #{error_messages.call}".html_safe
	end
end