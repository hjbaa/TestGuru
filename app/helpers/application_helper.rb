# frozen_string_literal: true

module ApplicationHelper
  def github_url(author, repo, title)
    link_to title, "https://github.com/#{author}/#{repo}", target: '_blank', class: 'nav-link px-2 text-white'
  end

  def current_year
    Time.current.year
  end

  def flash_helper
    flash.map do |name, msg|
      content_tag :div, msg, class: "alert alert-#{name}", role: 'alert'
    end.join.html_safe
  end
end
