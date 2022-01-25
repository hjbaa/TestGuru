# frozen_string_literal: true

module Admin::BadgesHelper
  def rule_helper(badge)
    case badge.rule
    when 'certain_level_tests'
      content_tag :p, "Level: #{badge.option}"
    when 'first_try_test'
      content_tag :p, "Test title: #{badge.option}"
    else
      content_tag :p, "Category: #{badge.option}"
    end
  end
end
