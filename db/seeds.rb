# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Rails.env.development?
  puts "Droping the database"
  # rake db:drop
  puts "Clean!!!"

  puts "Creating a User"
    u = User.create!(email: "me@example.com",
                    password: "password"
                    )
    u.save

    p = u.profile
    p.bio = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    p.statement = "blah blah blash"
    p.tel = "(123)123-4567"
    p.cv = "My CV"
    p.email = "myotheremail@example.com"
    # p.image
    p.save

  puts "User created successfully!"

  puts "Creating some projects"
    p1 = Project.create(title: "Project Number 1",
                        description: "Hello World!")
    puts "adding images to p1"
      p1.images.create(image: File.open("#{Rails.root}/app/assets/images/rails.png"))
    puts "successfully"

    p2 = Project.create(title: "Project Number 2",
                        description: "Hello World!")
    puts "adding images to p2"
      3.times do
        p2.images.create(image: File.open("#{Rails.root}/app/assets/images/sample.jpg"))
      end
    puts "successfully"

    p3 = Project.create(title: "Project Number 3",
                        description: "Hello World!")
  puts "Projects created successfully"

  # puts "Creating an Image"
  #   i = Image.new
  #   i.image = File.open("#{Rails.root}/app/assets/images/sample.jpg")
  #   i.save!
  # puts "Image created successfully!"
else
  puts "NO"
end