def sign_in_user
  @user = create_user
  visit sign_in_path
  fill_in "Username", with: "PowderBear"
  fill_in "Password", with: "password"
  click_on "Sign In"
end

def sign_in_user_2
  user = create_user({website: "usasportscult.wordpress.com", wordpress_username: "amybertken"})
  visit sign_in_path
  fill_in "Username", with: "PowderBear"
  fill_in "Password", with: "password"
  click_on "Sign In"
end
