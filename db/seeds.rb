# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'ffaker'

AdminUser.create!(email: 'admin@example.com', password: '123456', password_confirmation: '123456')

user1 = User.create!(name: 'User_1', phone: '0-700-62-00-00', email: 'user1@example.com', password: '123456', password_confirmation: '123456')
user2 = User.create!(name: 'User_2', phone: '0-555-67-12-14', email: 'user2@example.com', password: '123456', password_confirmation: '123456')
user3 = User.create!(name: 'User_3', phone: '0-777-68-10-00', email: 'user3@example.com', password: '123456', password_confirmation: '123456')
user4 = User.create!(name: 'User_4', phone: '0-556-63-12-14', email: 'user4@example.com', password: '123456', password_confirmation: '123456')
user5 = User.create!(name: 'User_5', phone: '0-556-19-00-10', email: 'user5@example.com', password: '123456', password_confirmation: '123456')

users = User.all

organization_category_1 = OrganizationCategory.create!(   
  name: 'Активисты', 
  description: 'Necessitatibus a nam dolorum, adipisci nesciunt reprehenderit.',
  active: true    
)
organization_category_2= OrganizationCategory.create!(   
  name: 'Детский дом', 
  description: 'Quod reprehenderit similique voluptas consectetur facilis.',
  active: true    
)
organization_category_3 = OrganizationCategory.create!(   
  name: 'Дом престарелых', 
  description: 'Explicabo earum libero fuga commodi, animi beatae nihil et molestias.',
  active: true    
)

oblast_1 = Oblast.create!(
  name: 'г. Бишкек'
)
oblast_2 = Oblast.create!(
  name: 'г. Ош'
)
oblast_3 = Oblast.create!(
  name: 'Баткенская область'
)
oblast_4 = Oblast.create!(
  name: 'Джалал-Абадская область'
)
oblast_5 = Oblast.create!(
  name: 'Иссык-Кульская область'
)
oblast_6 = Oblast.create!(
  name: 'Нарынская область'
)
oblast_7 = Oblast.create!(
  name: 'Ошская область'
)
oblast_8 = Oblast.create!(
  name: 'Таласская область'
)
oblast_9 = Oblast.create!(
  name: 'Чуйская область'
)

organizations = Organization.create!([
  {
    name: 'Волонтеры',
    oblast_id: oblast_1.id,
    location: 'г. Бишкек',
    address: 'Кыргызстан, Чуйская область, г. Бишкек',
    phone: '+996 (3134) 33172',
    organization_category_id: organization_category_1.id,
    active: true,
    latitude: '42.87596410238256',
    longitude: '74.54360961914062'
  },
  {
    name: 'Военно-Антоновский детский дом',
    oblast_id: oblast_9.id,
    location: 'с. Военно-Антоновка',
    address: 'Кыргызстан, Чуйская область, Сокулукский район, с. Военно-Антоновка, ул. Фрунзе, 118',
    phone: '+996 (3134) 33172',
    organization_category_id: organization_category_2.id,
    url: 'www.v-adetdom.kg',
    active: true,
    latitude: '42.9008671451945',
    longitude: '74.64300155639648'
  },
  {
    name: 'Ак-Суйский детский дом',
    oblast_id: oblast_5.id,
    location: 'с. Теплоключенка',
    address: 'Кыргызстан, Иссык-Кульская область, Ак-Суйский район, с. Теплоключенка, ул. Ленина, 152',
    phone: '+996 (3948) 91109',
    organization_category_id: organization_category_2.id,
    url: '',
    active: true,
    latitude: '42.91155476081381',
    longitude: '74.59613800048828'
  },
  {
    name: 'Бишкекский городской дом-интернат общего типа для престарелых',
    oblast_id: oblast_9.id,
    location: 'г. Бишкек',
    address: 'Кыргызстан, Чуйская область, Первомайский район, г. Бишкек, ул. Абая, 57',
    phone: '+996 (312) 540305',
    organization_category_id: organization_category_3.id,
    url: ' www.dominter.biz',
    active: true,
    latitude: '42.86413792617463',
    longitude: '74.58824157714844'
  },
  {
    name: 'Дом-интернат для пожилых людей Ленинского района мэрии г. Бишкек',
    oblast_id: oblast_9.id,
    location: 'г. Бишкек',
    address: 'Кыргызстан, Чуйская область, Ленинский район, г. Бишкек, ул. Интергельпо, 8',
    phone: '+996 (312) 653711',
    organization_category_id: organization_category_3.id,
    url: '',
    active: true,
    latitude: '42.850799307092515',
    longitude: '74.6407699584961'
  },
  {
    name: 'Орловский детский дом',
    oblast_id: oblast_9.id,
    location: 'пгт. Орловка',
    address: 'Кыргызстан, Чуйская область, Кеминский район, пгт. Орловка, ул. Победы, 16',
    phone: '+996 (3137) 23459',
    organization_category_id: organization_category_2.id,
    url: '',
    active: true,
    latitude: '',
    longitude: ''
  },
  {
    name: 'Специализированный дом ребёнка (СДР)',
    oblast_id: oblast_9.id,
    location: 'г. Бишкек',
    address: 'Кыргызстан, Чуйская область, Октябрьский район, г. Бишкек, ул. Белорусская, 121',
    phone: '+996 (3138) 62971',
    organization_category_id: organization_category_2.id,
    url: '',
    active: true,
    latitude: '42.835947266683796',
    longitude: '74.60609436035156'
  }
])

UserOrganization.create!([
  {
    user_id: user1.id,
    organization_id: organizations[0].id,
    role: 2
  },
  {
    user_id: user2.id,
    organization_id: organizations[0].id,
    role: 2
  },
  {
    user_id: user3.id,
    organization_id: organizations[0].id,
    role: 2
  },
  {
    user_id: user4.id,
    organization_id: organizations[0].id,
    role: 2
  },
  {
    user_id: user5.id,
    organization_id: organizations[0].id,
    role: 2
  },
  {
    user_id: user1.id,
    organization_id: organizations[2].id,
    role: 1
  },
  {
    user_id: user1.id,
    organization_id: organizations[3].id,
    role: 1
  },
  {
    user_id: user1.id,
    organization_id: organizations[5].id,
    role: 2
  },
  {
    user_id: user2.id,
    organization_id: organizations[3].id,
    role: 2
  },
  {
    user_id: user2.id,
    organization_id: organizations[5].id,
    role: 1
  }
])
user_organizations = UserOrganization.all

PostCategory.create!([
  {
      name: "Нужна помощь"
  },
  {
      name: "Отчет о проделанной работе"
  },
  {
      name: "Делимся радостью"
  },
  {
      name: "Благодарность"
  }
])
post_categories = PostCategory.all

20.times do
  org = user_organizations[rand(0...user_organizations.size)]
  Post.create!([
      {
          title: FFaker::Lorem.sentence(word_count=5),
          body: FFaker::Lorem.paragraph,
          post_category: post_categories[rand(0...post_categories.size)],
          organization: org.organization,
          user: org.user
      }
  ])
end

posts = Post.all

50.times do
  PostComment.create!([
    {
      body: FFaker::Lorem.paragraph,
      post: posts[rand(0...posts.size)],
      user: users[rand(0...users.size)]
    }
  ])
end

aid_posts = Post.all.where(post_category_id: 1)

20.times do
  Aid.create!([
    {
       description: FFaker::Lorem.paragraph,
       post: aid_posts[rand(0...aid_posts.size)],
       user: users[rand(0...users.size)],
       organization: organizations.first,
       status: rand(0..2)
    }
  ])
end




