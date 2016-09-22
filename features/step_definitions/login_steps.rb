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
  expect(page).to have_content(text)
  sleep(3)
end