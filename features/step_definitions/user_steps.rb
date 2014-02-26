Given(/^I am at the signup form$/) do
  visit '/users/new'
end

When(/^I click signup$/) do
  fill_in("user_username", :with => "Bob")
  fill_in("user_password", :with => "s3cr3t")
  fill_in("user_confirm_password", :with => "s3cr3t")
  click_button 'Sign up'
end

Then(/^I can see my name$/) do
  expect(page).to have_content("Hello Bob")
end