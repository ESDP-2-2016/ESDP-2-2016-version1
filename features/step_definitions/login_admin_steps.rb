When(/^ввожу в поле "([^"]*)" текст "([^"]*)"$/) do |field, value|
  fill_in field, with:value
  sleep(1)
end


When(/^я на странице "\/admin\/login"$/) do
  visit new_admin_user_session_path
  sleep(1)
end

