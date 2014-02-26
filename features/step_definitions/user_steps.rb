Given(/^I am at the signup form$/) do
  visit '/users/new'
end

When(/^I click signup$/) do
  fill_in("user_username", :with => "Bob")
  # fill_in("user_password", :with => "s3cr3t")
  # fill_in("user_confirm_password", :with => "s3cr3t")
  click_button 'Sign up'
end

Then(/^I can see my name$/) do
  expect(page).to have_content("Hello Bob")
end 

When(/^I signup with a non unique username$/) do
  User.create(username: 'Bob')
    # , password: 's3cr3t', password_confirmation: 's3cr3t')
  fill_in("user_username", :with => "Bob")
  # fill_in("user_password", :with => "s3cr3t")
  # fill_in("user_confirm_password", :with => "s3cr3t")
  click_button 'Sign up'  
end

Then(/^I get an error$/) do
  expect(page).to have_content('Username has already been taken')
end