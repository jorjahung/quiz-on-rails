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

# Then(/^I should see an answer$/) do
#   expect(page).not_to have_content(@answer)
#     click_button 'Show answer'
#     expect(page).to have_content(@answer)
# end

And(/^I click correct answer$/) do
  expect(page).to have_content('True')
  expect(page).to have_content('False')
  click_button(@answer.to_s.capitalize)
end

Then(/^I should see 'correct'$/) do
  expect(page).to have_content('Correct!!!!!')
end

Given(/^I want to create a new question$/) do
  visit '/questions/new'
end

When(/^I submit the form$/) do
  fill_in("question_body", :with => @body)
  check("question[answer]") 
  click_button 'Submit'
end

Then(/^I can see it in the homepage$/) do
  expect(page).to have_content(@body)
end

Then(/^I see a notice that it has been saved$/) do
  expect(page).to have_content("Question saved!")
end