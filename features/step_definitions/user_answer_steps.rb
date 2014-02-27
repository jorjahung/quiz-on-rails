Given(/^I am in the homepage$/) do
  visit '/'
end

Given(/^there is a user$/) do
  @user = User.create(username: 'Bob', password: 's3cr3t', password_confirmation: 's3cr3t')
end

When(/^I click on true$/) do
  click_button 'True'
end

Then(/^I should see my answer recorded$/) do
  expect(page).to have_content('You answered true')
end
