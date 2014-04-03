Given(/^I am in the homepage$/) do
  visit '/'
end

Given(/^there is a user signed in$/) do
  Question.first.update(user_id: 38)
  @user = User.create(username: 'Bob3', password: 's3cr3t', password_confirmation: 's3cr3t')
  visit signin_path
  fill_in('username', :with => @user.username)
 	fill_in('password', :with => @user.password)
 	click_button 'Sign in'
end

When(/^I click on true$/) do
  click_button 'True'
end

Then(/^I should see my answer recorded$/) do
  expect(page).to have_content('You answered true')
end

When(/^I click on the correct answer$/) do
  click_button 'True'
end

Then(/^I should see my score$/) do
  expect(page).to have_content('Score: 1')
end

