
When(/^я на странице юзера "\/organizations\/new"$/) do
  visit new_organization_path
  sleep(1)
end

When(/^я на странице админ "\/admin\/organizations"$/) do
  visit admin_organizations_path
  sleep(1)
end

When(/^введу "([^"]*)" в поле "([^"]*)"$/) do |value, field|
  fill_in field, with:value
end

When(/^выбираю "([^"]*)" в поле "([^"]*)"$/) do |value, field|
  page.select(value, :from => field)
end

When(/^кликаю на  "([^"]*)"$/) do |button|
  click_button button
  sleep(3)
end
When(/^radio "([^"]*)" в поле "([^"]*)"$/) do |value, field|
  choose(value)
end


When(/^должен на главную страницу$/) do
  visit root_path
  sleep(1)
  end


When /^I follow "([^"]*)" for "([^"]*)"$/ do |link, person|
  # Use capybara to find row based on 'person' text... no need for the additional 'find'
  # the '.,' sets the scope to the current node, that is the tr in question
  within(:xpath, "//tbody/tr[@id='#{person}']") do
    click_link(link)
  end
  sleep(1)
end


When(/^перехожу на "\/organizations\/list"$/) do
  visit ('/organizations/list')
  sleep(10)
end