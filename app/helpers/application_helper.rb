module ApplicationHelper
	def active_page?(path)
		"active" if current_page?(path)
	end

	def flash_css_class(type)
		case type
		when :alert
			"alert-box alert"
		when :warning
			"alert-box warning"
		when :success
			"alert-box success"
		when :info
			"alert-box info"
		when :notice
			"alert-box notice"
		when :secondary
			"alert-box secondary"
		else
			""
		end
	end
end