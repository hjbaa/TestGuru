# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([{ login: 'hjbaa', password: 'abcdef' }, { login: 'layvblessn', password: 'qwerty' }])
categories = Category.create!([{ title: 'Backend' }, { title: 'Frontend' }, { title: 'Machine Learning' },
                               { title: 'Programming Language' }])

tests = Test.create!([{ title: 'Ruby', author_id: users[0].id, level: 0, category_id: categories[3].id },
                      { title: 'Rails', author_id: users[1].id, level: 1, category_id: categories[0].id },
                      { title: 'Node', author_id: users[0].id, level: 1, category_id: categories[0].id },
                      { title: 'C++', author_id: users[1].id, level: 3, category_id: categories[3].id },
                      { title: 'Python', author_id: users[1].id, level: 2, category_id: categories[2].id }])

questions = Question.create!([{ title: 'Which method allows you to lowercase a string?', test_id: tests[0].id },
                              { title: 'How to create model in rails?', test_id: tests[1].id }])

Answer.create!([{ content: 'dcase()', question_id: questions[0].id },
                { content: 'downcase()', correct: true, question_id: questions[0].id },
                { content: 'rails model g', question_id: questions[1].id },
                { content: 'rails g model', question_id: questions[1].id, correct: true }])

TestsByUser.create!([{ user_id: users[0].id, test_id: tests[0].id }, { user_id: users[0].id, test_id: tests[1].id },
                     { user_id: users[0].id, test_id: tests[2].id }, { user_id: users[0].id, test_id: tests[3].id },
                     { user_id: users[0].id, test_id: tests[4].id }])
