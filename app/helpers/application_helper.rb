module ApplicationHelper
	def active_page?(path)
		"active" if current_page?(path)
	end

	def flash_css_class(type)
		case type
		when :success
			"alert alert-success alert-dismissible"
		when :info
			"alert alert-info alert-dismissible"
		when :warning
			"alert alert-warning alert-dismissible"
		when :danger
			"alert alert-danger alert-dismissible"
		else
			"alert alert-info alert-dismissible"
		end
	end
end
