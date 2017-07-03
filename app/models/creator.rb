class Creator
  def self.create
    User.destroy_all
    50.times do |i|
      first_name, last_name = Faker::Name.unique.name.split(' ')
      department = %w(Бухгалтерия Менеджмент Информационный).sample
      region = %w(Москва Санкт-Петербург Самара Киров).sample
      job_title = %w(Начальник Менеджер Маркетолог ИТ-Специалист).sample
      new_user = User.create!(
        first_name: first_name,
        last_name: last_name,
        password: 'password',
        department: department,
        region: region,
        job_title: job_title,
        email: Faker::Internet.unique.email,
      )
      types = ["INTJ", "INTP", "ENTJ", "ENTP", "INFJ", "INFP", "ENFP", "ISTJ", "ISFJ", "ESTJ", "ESFJ", "ISTP", "ISFP", "ESTP", "ESFP"]
      if rand > 0.5
        new_user.quiz_results.create(personality_type: types.sample)
      end
    end
    # User.create!(
    #   first_name: 'Антон',
    #   last_name: 'Яковлев',
    #   password: 'passowrd',
    #   email: "user#{i+=1}@gmail.com",
    # )
    # User.create!(
    #   first_name: 'Анастасия',
    #   last_name: 'Сухорукова',
    #   password: 'passowrd',
    #   email: "user#{i+=1}@gmail.com",
    # )
    # User.create!(
    #   first_name: 'Сергей',
    #   last_name: 'Сиваков',
    #   password: 'passowrd',
    #   email: "user#{i+=1}@gmail.com",
    # )
  end
end