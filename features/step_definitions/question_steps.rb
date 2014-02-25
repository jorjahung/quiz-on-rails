Given(/^there is a question$/) do
  @body = "The Eiffel Tower is in Paris. (T/F)"
  @answer = true
  Question.create(body: @body, answer: @answer)
end

When(/^I visit the homepage$/) do
  visit '/'
end

Then(/^I should see a question$/) do
  expect(page).to have_content(@body)
end

Then(/^I should see an answer$/) do
    expect(page).to have_content(@answer)
end