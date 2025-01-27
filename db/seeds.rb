admin_user = Admin.create(nik_name: "Super",
                          email: "test-guru@mail-cml.ru",
                          first_name: "Super",
                          last_name: "Admin",
                          password: "123456",
                          password_confirmation: "123456")
categories = Category.create!([
  { title: "Мир вокруг нас" },
  { title: "Общие вопросы" }
])
test_admin = Test.create([
  { title: "Животные", level: 1, category: categories[0], author: admin_user },
  { title: "Растения", level: 1, category: categories[0], author: admin_user },
  { title: "Интересные вопросы", level: 1, category: categories[1], author: admin_user }
])
questions = Question.create(
  [
    { body: "У какого животного самые большие глаза относительно тела?", test: test_admin[0],
     answers: [Answer.new(body: "У лемура"),
               Answer.new(body: "У летучей мыши"),
               Answer.new(body: "У долгопята", correct: true),
               Answer.new(body: "У тупайи")] },

    { body: "К какому роду принадлежит панда белого цвета с черными лапами, ушами и участками вокруг глаз?", test: test_admin[0],
     answers: [Answer.new(body: "Средняя панда"),
               Answer.new(body: "Малая панда"),
               Answer.new(body: "Белая панда"),
               Answer.new(body: "Большая панда", correct: true)] },

    { body: "У какого животного самые большие глаза относительно тела?", test: test_admin[0],
     answers: [Answer.new(body: "У лемура"),
               Answer.new(body: "У летучей мыши"),
               Answer.new(body: "У долгопята", correct: true),
               Answer.new(body: "У тупайи")] },
    { body: "Какое из этих растений — плотоядное?", test: test_admin[1],
     answers: [Answer.new(body: "Володушка"),
               Answer.new(body: "Росянка", correct: true),
               Answer.new(body: "Мытник"),
               Answer.new(body: "Астрагал")] },
    { body: "Какая пряность по форме напоминает звездочку?", test: test_admin[1],
     answers: [Answer.new(body: "Майоран"),
               Answer.new(body: "Кардамон"),
               Answer.new(body: "Гвоздика"),
               Answer.new(body: "Бадьян", correct: true)] },
    { body: "Цветы какого из этих растений не голубого цвета?", test: test_admin[1],
     answers: [Answer.new(body: "Василек"),
               Answer.new(body: "Незабудка"),
               Answer.new(body: "Лютик", correct: true),
               Answer.new(body: "Цикорий")] },
    { body: "Как назывался особый головной убор, который носили фараоны в Древнем Египте?", test: test_admin[2],
     answers: [Answer.new(body: "Картуз"),
               Answer.new(body: "Немес", correct: true),
               Answer.new(body: "Корона"),
               Answer.new(body: "Убрус")] },
    { body: "Какие огурцы сажал на брезентовом поле герой одноименной песни?", test: test_admin[2],
     answers: [Answer.new(body: "Железные"),
               Answer.new(body: "Оловянные"),
               Answer.new(body: "Медные"),
               Answer.new(body: "Алюминиевые", correct: true)] },
    { body: "Детинцем на Руси называли...", test: test_admin[2],
     answers: [Answer.new(body: "Железные"),
               Answer.new(body: "Оловянные"),
               Answer.new(body: "Медные"),
               Answer.new(body: "Алюминиевые"), correct: true] },
    { body: "Детинцем на Руси называли...", test: test_admin[2],
     answers: [Answer.new(body: "Кремль", correct: true),
               Answer.new(body: "Школу"),
               Answer.new(body: "Княжеский терем"),
               Answer.new(body: "Монастырь")] },
    { body: "Как называли строителя в старину?", test: test_admin[2],
     answers: [Answer.new(body: "Бондарь"),
               Answer.new(body: "Бортник"),
               Answer.new(body: "Зодчий", correct: true),
               Answer.new(body: "Кормчий")] }

  ]
)
