Given(/^I am at the signup form$/) do
  visit '/users/new'
end

When(/^I click signup$/) do
  fill_in("user[username]", :with => "Bob")
  fill_in("user[password]", :with => "s3cr3t")
  fill_in("user[password_confirmation]", :with => "s3cr3t")
  click_button 'Sign up'
end

Then(/^I can see my name$/) do
  expect(page).to have_content("Hello Bob")
end 

When(/^I signup with a non unique username$/) do
  User.create(username: 'Bob', password: 's3cr3t', password_confirmation: 's3cr3t')
  fill_in("user[username]", :with => "Bob")
  fill_in("user[password]", :with => "s3cr3t")
  fill_in("user[password_confirmation]", :with => "s3cr3t")
  click_button 'Sign up'  
end

Then(/^I get '(.*?)'$/) do |arg|
  expect(page).to have_content(arg)
end

When(/^I signup without a password$/) do
  fill_in("user[username]", :with => "Bob")
  click_button 'Sign up'  
end


Given(/^I am signed in$/) do
  @user = User.create(username: 'Elvis', password: 's3cr3t', password_confirmation: 's3cr3t')
  visit signin_path
  fill_in('username', :with => @user.username)
  fill_in('password', :with => @user.password)
  click_button 'Sign in'
  Question.create(body: "Did Elvis sing Jailhouse rock?", answer: true)
end

Then(/^I should not see my questions$/) do
  expect(page).not_to have_content("Did Elvis sing Jailhouse rock?")
end