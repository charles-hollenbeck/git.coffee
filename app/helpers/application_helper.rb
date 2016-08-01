require 'rouge/plugins/redcarpet'

module ApplicationHelper
  	def recent_github_updates
  		if getSetting("github_oauth")
	  		git_api = Github.new oauth_token: getSetting("github_oauth")
	  		return git_api.repos.list(user: "charles-hollenbeck", sort: "pushed", direction: "DESC", type: "owner")[0..5]
  		else
  			return Github.repos.list(user: "charles-hollenbeck", sort: "pushed", direction: "DESC", type: "owner")[0..5]
		end
	end

	def getSetting(name)
		Setting.find_by(name: name)[:value].to_s
	end

	class SyntaxHighlight < Redcarpet::Render::HTML
		include Rouge::Plugins::Redcarpet
	end

	def markdown(text)
		syntax_highlighted = SyntaxHighlight.new(:filter_html => true, :hard_wrap => true)
		options = {
					:fenced_code_blocks => true,
					:no_intra_emphasis => true,
					:autolink => true,
					:strikethrough => true,
					:lax_html_blocks => true,
					:superscript => true
				}
		renderer = Redcarpet::Markdown.new(syntax_highlighted, options)

		return renderer.render(text).html_safe
	end
end