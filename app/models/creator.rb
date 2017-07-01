class Creator
  def self.create
    User.destroy_all
    i = 1
    50.times do |i|
      first_name, last_name = Faker::Name.unique.name.split(' ')
      User.create!(
        first_name: first_name,
        last_name: last_name,
        password: 'passowrd',
        email: Faker::Internet.unique.email,
      )
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