# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'
User.destroy_all
Blog.destroy_all
csv_text = File.read('/Users/amybertken/workspace/personal_projects/blog_reader/users_seed.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  u = User.create!(email: row[0], username: row[1], wordpress_username: row[2], role: row[3])
  b = Blog.create!(url: row[4], user: u)
end
