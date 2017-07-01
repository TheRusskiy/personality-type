class Creator
  def self.create
    User.destroy_all
    i = 1
    User.create!(
      first_name: 'Антон',
      last_name: 'Яковлев',
      password: 'passowrd',
      email: "user#{i+=1}@gmail.com",
    )
    User.create!(
      first_name: 'Анастасия',
      last_name: 'Сухорукова',
      password: 'passowrd',
      email: "user#{i+=1}@gmail.com",
    )
    User.create!(
      first_name: 'Сергей',
      last_name: 'Сиваков',
      password: 'passowrd',
      email: "user#{i+=1}@gmail.com",
    )
  end
end