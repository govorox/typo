# Additional steps 

Given /the following (.*?) exist:$/ do |type, table|
  table.hashes.each do |element|
    if    type == "users"    then User.create(element)
    elsif type == "articles" then Article.create(element)
    elsif type == "comments" then Comment.create(element)
    end
  end
end

Given /I am logged in as "(.*?)" with pass "(.*?)"$/ do |user, pass|
  #usr = User.find_by_login($1)
  #pass = usr.password
  visit '/accounts/login'
  fill_in 'user_login', :with => user
  fill_in 'user_password', :with => pass
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

And /^I am viewing categories$/ do
  visit '/admin/category'
  if page.respond_to? :should
    page.should have_content('Manage Categories')
  else
    assert page.has_content?('Manage Categories')
  end
end
