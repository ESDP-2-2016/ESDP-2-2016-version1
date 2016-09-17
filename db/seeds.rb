# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: '123456', password_confirmation: '123456')


organization_category_1 = OrganizationCategory.create!(   
  name: 'Детский дом', 
  description: 'Quod reprehenderit similique voluptas consectetur facilis.',
  active: true    
)
organization_category_2 = OrganizationCategory.create!(   
  name: 'Донорская помощь', 
  description: 'Necessitatibus a nam dolorum, adipisci nesciunt reprehenderit.',
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
    name: 'Военно-Антоновский детский дом',
    oblast_id: oblast_9.id,
    location: 'с. Военно-Антоновка',
    address: 'Кыргызстан, Чуйская область, Сокулукский район, с. Военно-Антоновка, ул. Фрунзе, 118',
    phone: '+996 (3134) 33172',
    organization_category_id: organization_category_1.id,
    url: 'www.v-adetdom.kg',
    active: true
  }, 
  {    
    name: 'Ак-Суйский детский дом',
    oblast_id: oblast_5.id,
    location: 'с. Теплоключенка',
    address: 'Кыргызстан, Иссык-Кульская область, Ак-Суйский район, с. Теплоключенка, ул. Ленина, 152',
    phone: '+996 (3948) 91109',
    organization_category_id: organization_category_1.id,
    url: '',
    active: true
  }, 
  {    
    name: 'Бишкекский городской дом-интернат общего типа для престарелых',
    oblast_id: oblast_9.id,
    location: 'г. Бишкек',
    address: 'Кыргызстан, Чуйская область, Первомайский район, г. Бишкек, ул. Абая, 57',
    phone: '+996 (312) 540305',
    organization_category_id: organization_category_3.id,
    url: ' www.dominter.biz',
    active: true
  }, 
  {    
    name: 'Дом-интернат для пожилых людей Ленинского района мэрии г. Бишкек',
    oblast_id: oblast_9.id,
    location: 'г. Бишкек',
    address: 'Кыргызстан, Чуйская область, Ленинский район, г. Бишкек, ул. Интергельпо, 8',
    phone: '+996 (312) 653711',
    organization_category_id: organization_category_3.id,
    url: '',
    active: true
  }, 
  {    
    name: 'Орловский детский дом',
    oblast_id: oblast_9.id,
    location: 'пгт. Орловка',
    address: 'Кыргызстан, Чуйская область, Кеминский район, пгт. Орловка, ул. Победы, 16',
    phone: '+996 (3137) 23459',
    organization_category_id: organization_category_1.id,
    url: '',
    active: true
  }, 
  {    
    name: 'Айс Квин ОсОО',
    oblast_id: oblast_9.id,
    location: 'г. Бишкек',
    address: 'Кыргызстан, Чуйская область, Первомайский район, г. Бишкек, ул. Аэропортинская, 1',
    phone: '+996 (770) 676017',
    organization_category_id: organization_category_2.id,
    url: ' icequene.wix.com/catalog',
    active: true
  }, 
  {    
    name: 'Atalyk Group ЗАО',
    oblast_id: oblast_9.id,
    location: 'с. Новопокровка',
    address: 'Кыргызстан, Чуйская область, Иссык-Атинский район, 725022 с. Новопокровка, ул.Ленина, 250',
    phone: '+996 (312) 617555',
    organization_category_id: organization_category_2.id,
    url: ' www.atalyk.com.kg',
    active: true
  }, 
  {    
    name: 'Специализированный дом ребёнка (СДР)',
    oblast_id: oblast_9.id,
    location: 'г. Бишкек',
    address: 'Кыргызстан, Чуйская область, Октябрьский район, г. Бишкек, ул. Белорусская, 121',
    phone: '+996 (3138) 62971',
    organization_category_id: organization_category_1.id,
    url: '',
    active: true
  } 
])

