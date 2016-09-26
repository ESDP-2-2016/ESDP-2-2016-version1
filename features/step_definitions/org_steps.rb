
When(/^я на странице юзера "\/organizations\/new"$/) do
  visit new_organization_path
  sleep(2)
end

When(/^введу "([^"]*)" в поле "([^"]*)"$/) do |value, field|
  fill_in field, with:value
end

When(/^выбираю "([^"]*)" в поле "([^"]*)"$/) do |value, field|
  page.select(value, :from => field)
end

When(/^кликаю на  "([^"]*)"$/) do |button|
  click_button button
end

When(/^должен на главную страницу$/) do
  visit root_path
end