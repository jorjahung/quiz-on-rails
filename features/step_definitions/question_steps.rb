

Given(/^there is a question$/) do
  @body = "Is the Eiffel Tower in Paris?"
  Question.create(body: @body)
end

When(/^I visit the homepage$/) do
  visit '/'
end

Then(/^I should see a question$/) do
  expect(page).to have_content(@body)
end
