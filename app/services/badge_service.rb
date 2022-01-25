# frozen_string_literal: true

# Сервис для присвоения бейджей после выполнения тестов
class BadgeService
  RULES = Badge.rules.keys

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    available_badges.each do |badge|
      @user.badges << badge if completed_condition?(badge)
    end
  end

  private

  def completed_condition?(badge)
    @option = badge.option

    case badge.rule
    when 'first_try_test'
      first_try_condition_completed?
    when 'certain_level_tests'
      level_condition_completed?
    else
      category_condition_completed?
    end
  end

  def level_condition_completed?
    tests_by_level_count = Test.where(level: @option.to_i).count
    # если количество тестов с определенным уровнем равно 0 - не выдаем бейдж
    # далее берем количество уникальных тестов, которые успешно прошел пользователь и сравниваем количества
    !tests_by_level_count.zero? &&
      TestPassage.where(successfully_passed?: true, user: @user, test: Test.by_level(@option.to_i))
                 .to_a.uniq(&:test_id).count == tests_by_level_count
  end

  def first_try_condition_completed?
    test = Test.find_by_title(@option)
    TestPassage.where(user: @user, test: test).count == 1
  end

  def category_condition_completed?
    tests_be_category_count = Test.where(category: Category.find_by_title(@option)).count

    !tests_be_category_count.zero? &&
      TestPassage.where(successfully_passed?: true, user: @user, test: Test.by_category(@option))
                 .to_a.uniq(&:test_id).count == tests_be_category_count
  end

  def available_badges
    tmp = []

    tmp += Badge.where(rule: RULES[0], option: @test_passage.test.category.title)
    tmp += Badge.where(rule: RULES[1], option: @test_passage.test.title)
    tmp + Badge.where(rule: RULES[2], option: @test_passage.test.level)
  end
end
