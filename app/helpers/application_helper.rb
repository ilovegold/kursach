module ApplicationHelper
	def full_title(page_title)
		base_title = "Ruby on Rails Tutorial Sample App"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

	def greeting()
		"Hi, " + ((user_signed_in?) ? current_user.name : "Guest")
	end
end
