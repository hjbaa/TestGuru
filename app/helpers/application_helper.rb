# frozen_string_literal: true

module ApplicationHelper
  def github_url(author, repo, title)
    link_to title, "https://github.com/#{author}/#{repo}", class: 'nav-link px-2 text-white'
  end

  def current_year
    Time.current.year
  end
end
