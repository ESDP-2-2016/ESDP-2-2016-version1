When(/^я на странице "\/users\/sign_in"$/) do
  visit new_user_session_path
end

When(/^ввожу "([^"]*)" в поле "([^"]*)"$/) do |value, field|
  fill_in field, with:value
end

When(/^кликаю на кнопку "([^"]*)"$/) do |button|
  click_button button
end

When(/^должен перейти на главную страницу$/) do
  visit root_path
end

When(/^должен увидеть текст "([^"]*)"$/) do |text|
  page.has_content?(text)
  puts "Добро пожаловать"
  # sleep(3)
end

When(/^я на странице "\/users\/sign_up"$/) do
  visit new_user_registration_path
end

When(/^я на странице создания поста$/) do
  visit new_post_path
end