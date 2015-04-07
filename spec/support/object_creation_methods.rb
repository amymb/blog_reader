def create_user(overrides = {})
  defaults = {username: "PowderBear", password: "password"}
  User.create!(defaults.merge(overrides))
end
