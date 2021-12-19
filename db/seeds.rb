# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([{ login: 'hjbaa', password: 'abc-def', email: 'abcdef@gmail.com' },
                      { login: 'layvblessn', password: 'qwerty', email: 'abcd@gmail.com' }])

categories = Category.create!([{ title: 'Backend' }, { title: 'Frontend' }, { title: 'Machine Learning' },
                               { title: 'Programming Language' }, { title: 'DevOps' }])

tests = Test.create!([{ title: 'Rails', author: users[1], level: 1, category: categories[0] },
                      { title: 'Node', author: users[0], level: 1, category: categories[0] },
                      { title: 'Javascript', author: users[0], level: 2, category: categories[1] },
                      { title: 'Python', author: users[1], level: 2, category: categories[2] },
                      { title: 'Ruby', author: users[0], category: categories[3] },
                      { title: 'C++', author: users[1], level: 3, category: categories[3] }])

questions = Question.create!([{ title: 'Which method allows you to lowercase a string?', test: tests[0] },
                              { title: 'How to create model in rails?', test: tests[1] }])

Answer.create!([{ content: 'd_case()', question: questions[0] },
                { content: 'lowercase()', question: questions[0] },
                { content: 'l_case()', question: questions[0] },
                { content: 'downcase()', correct: true, question: questions[0] },
                { content: 'rails model g', question: questions[1] },
                { content: 'rails g model', question: questions[1], correct: true }])

tests.each do |test|
  users[0].tests.push(test)
end

users[1].tests.push(tests[0])
