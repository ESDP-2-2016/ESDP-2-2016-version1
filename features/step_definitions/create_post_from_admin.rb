When(/^кликаю на ссылку "([^"]*)"$/) do |arg|
  click_link arg
  sleep(1)
end

When(/^я на странице "\/posts"$/) do
  visit posts_path
  sleep(1)
end