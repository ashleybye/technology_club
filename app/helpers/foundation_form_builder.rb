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

	# grouped_radio_buttons(method, tag_values, *args)
	# loops through tag_values to determine tag_value and determines if checked for each radio button
	# usage: grouped_radio_buttons(:admin, {yes: true, no: false}, default: false, class: '')
	def grouped_radio_buttons(method, tag_values, *args)
		options = args.extract_options!.symbolize_keys!
		options[:label] ||= "#{method.to_s}".humanize
		options[:class] ||= ""
		options[:default] ||= nil
		options.delete(:object)

		label = lambda do
			label_tag("#{@object_name}[#{method}]", "#{options[:label]}", class: "") do
				label = "#{options[:label]}"
				options.delete(:label)

				label.html_safe
			end
		end

		content = lambda do
			radio_buttons = ""
			tag_values.symbolize_keys!
			tag_values.each do |tag_name, tag_value|
				default = ""
				default = "default: true" if tag_value == options[:default]
				radio_buttons << radio_button(method, tag_value, options)
				radio_buttons << label(method, tag_name.to_s.capitalize, options)
			end
			radio_buttons
		end

		"#{label.call} #{content.call}".html_safe
	end
end