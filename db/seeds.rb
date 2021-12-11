# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([{ login: 'hjbaa', password: 'abcdef' }, { login: 'layvblessn', password: 'qwerty' }])
Category.create([{ title: 'Backend' }, { title: 'Frontend' }, { title: 'Machine Learning' },
                 { title: 'Programming Language' }])

Test.create([{ title: 'Ruby', author_id: 1, level: 0, category_id: 4 },
             { title: 'Rails', author_id: 2, level: 1, category_id: 1 }])

Question.create([{ title: 'Which method allows you to lowercase a string?', test_id: 1 },
                 { title: 'How to create model in rails?', test_id: 2 }])

Answer.create([{ content: 'dcase()', question_id: 1 },
               { content: 'downcase()', correct: true, question_id: 1 },
               { content: 'rails model g', question_id: 2 },
               { content: 'rails g model', question_id: 2, correct: true }])
TestsByUser.create([{ user_id: 1, test_id: 1 }, { user_id: 1, test_id: 2 }])
