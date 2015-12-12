# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Creating Members

    Member.create(email: 'snow.white@clientstrong.com', password: "password", first_name: 'Snow', last_name: 'White', address: 'Fairytale', mobile: '345-332-1233', birthday: '1902-01-01')
    Member.create(email: 'doc.dwarf@clientstrong.com', password: "password", first_name: 'Doc', last_name: 'Dwarf', address: 'Fairytale', mobile: '345-332-1233', birthday: '1902-01-01')
    Member.create(email: 'dopey.dwarf@clientstrong.com', password: "password", first_name: 'Dopey', last_name: 'Dwarf', address: 'Fairytale', mobile: '345-332-1233', birthday: '1902-01-01')
    Member.create(email: 'bashful.dwarf@clientstrong.com', password: "password", first_name: 'Bashful', last_name: 'Dwarf', address: 'Fairytale', mobile: '345-332-1233', birthday: '1902-01-01')
    Member.create(email: 'huntsman.who@clientstrong.com', password: "password", first_name: 'Huntsman', last_name: 'Who', address: 'Fairytale', mobile: '345-332-1233', birthday: '1902-01-01')

# Creating Roles

    Role.create(name: 'admin', description: 'access to all profiles, all lists')
    Role.create(name: 'coach', description: 'access to all their client profiles')
    Role.create(name: 'student', description: 'access to their profile, their own workouts')
    Role.create(name: 'anonymous', description: 'have access to unprotected areas')

# Assigning roles to Clients

#     # Admin
    Member.first.roles << Role.first

#     # #Trainer
    Member.find(2).roles << Role.find(2)
    # Member.find(3).roles << Role.find(2)

#     # #Student
    Member.find(3).roles << Role.find(3)
    Member.find(4).roles << Role.find(3)
#     User.find(6).roles << Role.find(3)
#     User.find(7).roles << Role.find(3)
#     User.find(8).roles << Role.find(3)
#     User.find(9).roles << Role.find(3)

#     # #Anonymous
    Member.find(5).roles << Role.find(4)
    # User.find(11).roles << Role.find(4)

# # Creating Exercises
    Exercise.create(name: 'Workout 1', author: 1, description: 'Tasked with getting rid of Snow White, the huntsman realizes he cannot and encourages her to run away from the Evil Queen.', intensity: 1)
    Exercise.create(name: 'Exercise 2', author: 1, description: 'Tasked with getting rid of Snow White, the huntsman realizes he cannot and encourages her to run away from the Evil Queen.', intensity: 2)
    Exercise.create(name: 'Exercise 3', author: 2, description: 'Tasked with getting rid of Snow White, the huntsman realizes he cannot and encourages her to run away from the Evil Queen.', intensity: 3)
    Exercise.create(name: 'Exercise 4', author: 2, description: 'Tasked with getting rid of Snow White, the huntsman realizes he cannot and encourages her to run away from the Evil Queen.', intensity: 4)
    Exercise.create(name: 'Exercise 5', author: 2, description: 'Tasked with getting rid of Snow White, the huntsman realizes he cannot and encourages her to run away from the Evil Queen.', intensity: 5)

# # Creating Permissions
#     Permission.create(description: 'login')
#     Permission.create(description: 'create-users')
#     Permission.create(description: 'create-workouts')
#     Permission.create(description: 'view-workouts')
#     Permission.create(description: 'view-users')
#     Permission.create(description: 'view-personal-clients')
#     Permission.create(description: 'view-personal-workouts')

# # Assign permissions to roles

#     # # Admin
#     Role.find(1).permissions << Permission.find(1)
#     Role.find(1).permissions << Permission.find(2)
#     Role.find(1).permissions << Permission.find(3)
#     Role.find(1).permissions << Permission.find(4)
#     Role.find(1).permissions << Permission.find(5)

#     # # Trainer
#     Role.find(2).permissions << Permission.find(1)
#     Role.find(2).permissions << Permission.find(2)
#     Role.find(2).permissions << Permission.find(3)
#     Role.find(2).permissions << Permission.find(6)
#     Role.find(2).permissions << Permission.find(7)

#     # # Student
#     Role.find(3).permissions << Permission.find(1)
#     Role.find(3).permissions << Permission.find(4)
#     Role.find(3).permissions << Permission.find(7)

#     # # Anonymous
#     Role.find(4).permissions << Permission.find(4)



