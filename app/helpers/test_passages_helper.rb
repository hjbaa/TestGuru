# frozen_string_literal: true

module TestPassagesHelper
  # rubocop:disable Metrics/AbcSize
  def time_parser
    content_tag(:tr, class: 'table-info') do
      [
        # Часы
        content_tag(:td, (@test_passage.test.seconds_for_passage - (Time.current - @test_passage.created_at).seconds)
                          .round / 3600, id: 'h'),
        # Минуты
        content_tag(:td, ((@test_passage.test.seconds_for_passage - (Time.current - @test_passage.created_at).seconds)
                          .round / 60) % 60, id: 'm'),
        # Секунды
        content_tag(:td, (@test_passage.test.seconds_for_passage - (Time.current - @test_passage.created_at).seconds)
                         .round % 60, id: 's')
      ].reduce(&:+)
    end
  end
  # rubocop:enable Metrics/AbcSize
  # https://stackoverflow.com/questions/20386324/rails-content-tag-for-ul-element - добавление через content_tag
  # нескольких тегов
end
