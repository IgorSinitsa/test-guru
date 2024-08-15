# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Faker::Config.locale = :ru

def range_rand
  (0..rand(2..5))
end

range_rand.each do
  User.create(user: Faker::Name.last_name, password: Faker::Alphanumeric.alpha(number: 10))
end

users_id = User.all.pluck(:id)

range_rand.each do
  category = Category.create(title: Faker::Lorem.word)

  range_rand.each do
    test = Test.create(title: Faker::Lorem.sentence(word_count: 3),
                       level: rand(1..3),
                       category_id: category.id,
                       author_id: users_id[rand(5)])
    range_rand.each do
      question = Question.create(body: Faker::Lorem.question,
                                 test_id: test.id)
      range_rand.each do
        Answer.create(body: Faker::Lorem.sentence(word_count: 3),
                      correct: rand(0..1),
                      question_id: question.id)
      end
    end
  end
end
