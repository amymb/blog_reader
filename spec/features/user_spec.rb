require 'rails_helper.rb'

feature 'user management' do
  scenario 'user can sign up' do
    visit root_path
    click_on "Sign Up"

    fill_in "Username", with: "Bunny5"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Complete Registration"
    expect(page).to have_content "Welcome to Blog Reader, Bunny5!"

  end

  scenario 'user without website can sign in, is directed to profile page' do
    user = create_user
    visit root_path
    click_on "Sign In"
    fill_in "Username", with: "PowderBear"
    fill_in "Password", with: "password"
    click_on "Sign In"
    expect(page).to have_content "PowderBear"
  end

  scenario 'user can edit profile' do
    sign_in_user
    expect(current_path).to eq user_path(@user)
    click_on "Add Wordpress Info"
    expect(page).to_not have_content "Add Blog"
    fill_in "Email", with: "user@email.com"
    fill_in "Wordpress username", with: "amybertken"
    click_on "Update Profile"

    expect(page).to have_content "Edit Profile"
  end


end
