Given(/^username and password$/) do
  @user = User.create(username: 'Bob', password: 's3cr3t', password_confirmation: 's3cr3t')
end

Given(/^I am in the signin page$/) do
  visit '/sessions/new'
end

When(/^I input the correct username and password$/) do
 fill_in('username', :with => @user.username)
 fill_in('password', :with => @user.password)
 click_button 'Sign in'
end

Then(/^I get signed in$/) do
  expect(page).to have_content('Signed in as Bob')
end
