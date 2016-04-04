module ApplicationHelper
	def full_title(page_title)
		base_title = "Stories"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

	def greeting()
		"Hi, " + ((user_signed_in?) ? current_user.name : "Guest")
	end

	def markdown(text)
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
    options = {
        autolink: true,
        no_intra_emphasis: true,
        fenced_code_blocks: true,
        lax_html_blocks: true,
        strikethrough: true,
        superscript: true,
        space_after_headers: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  	end


  	def latest_stories

  	end
end
