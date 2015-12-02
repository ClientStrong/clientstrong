# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Creating Clients

    User.create(first_name: 'Snow', last_name: 'White', notes: 'Snow white is a kinda and gentle princess, with lips red as as rose and skin white as sknow.', email: 'snow.white@clientstrong.com', active: true)
    User.create(first_name: 'Doc', last_name: 'Dwarf', notes: 'Self proclaimed leader of the group, Doc often looses his train of thought and bumbles around, looking over the dwarfs.', email: 'doc.dwarf@clientstrong.com', active: true)
    User.create(first_name: 'Dopey', last_name: 'Dwarf', notes: 'Although Dopey may annoy Doc & Grumpy, his intentions are silly and he is often the core of the dwarfs jokes.', email: 'dopey.dwarf@clientstrong.com', active: true)
    User.create(first_name: 'Bashful', last_name: 'Dwarf', notes: 'Being around Snow White increases bashfuls tendency to bury his head but she does not mind.', email: 'bashful.dwarf@clientstrong.com', active: false)
    User.create(first_name: 'Happy', last_name: 'Dwarf', notes: 'Fat and jolly with a friendly personality, Happy maintains laughter and joy amongst the dwarfs.', email: 'happy.dwarf@clientstrong.com', active: false)
    User.create(first_name: 'Sleepy', last_name: 'Dwarf', notes: 'While always eager to fall asleep, Sleepy is considered the most observant amongst the dwarfs.', email: 'sleepy.dwarf@clientstrong.com', active: false)
    User.create(first_name: 'Sneezy', last_name: 'Dwarf', notes: 'A bad case of hayfever causes Sneezy to sneeze violently and frequently but he does not let that stop him from having fun.', email: 'sneezy.dwarf@clientstrong.com', active: true)
    User.create(first_name: 'Grumpy', last_name: 'Dwarf', notes: 'Grumpy tends to be irritated with the other dwarfs antics and opposes allowing Snow White to stay with them.', email: 'grumpy.dwarf@clientstrong.com', active: true)
    User.create(first_name: 'Prince', last_name: 'Charming', notes: 'The cure to Snow Whites sleeping death, the Prince finds Snow White in the forest and kisses her to awaken her.', email: 'prince.charming@clientstrong.com', active: true)
    User.create(first_name: 'The', last_name: 'Queen', notes: 'Due to extreme jealously of Snow White, the Evil Queen plots how to remain the fairest of them all.', email: 'the.queen@clientstrong.com', active: true)
    User.create(first_name: 'Huntsman', last_name: 'Who', notes: 'Tasked with getting rid of Snow White, the huntsman realizes he cannot and encourages her to run away from the Evil Queen.', email: 'huntsman.who@clientstrong.com', active: true)

# Creating Roles

    Role.create(name: 'admin', description: 'access to all profiles, all lists')
    Role.create(name: 'coach', description: 'access to all their client profiles')
    Role.create(name: 'student', description: 'access to their profile, their own workouts')
    Role.create(name: 'anonymous', description: 'have access to unprotected areas')

# Assigning roles to Clients

    # Admin
    User.first.roles << Role.first

    # #Trainer
    User.find(2).roles << Role.find(2)
    User.find(3).roles << Role.find(2)

    # #Student
    User.find(4).roles << Role.find(3)
    User.find(5).roles << Role.find(3)
    User.find(6).roles << Role.find(3)
    User.find(7).roles << Role.find(3)
    User.find(8).roles << Role.find(3)
    User.find(9).roles << Role.find(3)

    # #Anonymous
    User.find(10).roles << Role.find(4)
    User.find(11).roles << Role.find(4)

# Creating Workouts
    Workout.create(title: 'Workout 1', duration: 30, description: 'Tasked with getting rid of Snow White, the huntsman realizes he cannot and encourages her to run away from the Evil Queen.', intensity: 1)
    Workout.create(title: 'Workout 2', duration: 30, description: 'Tasked with getting rid of Snow White, the huntsman realizes he cannot and encourages her to run away from the Evil Queen.', intensity: 2)
    Workout.create(title: 'Workout 3', duration: 60, description: 'Tasked with getting rid of Snow White, the huntsman realizes he cannot and encourages her to run away from the Evil Queen.', intensity: 3)
    Workout.create(title: 'Workout 4', duration: 60, description: 'Tasked with getting rid of Snow White, the huntsman realizes he cannot and encourages her to run away from the Evil Queen.', intensity: 4)
    Workout.create(title: 'Workout 5', duration: 60, description: 'Tasked with getting rid of Snow White, the huntsman realizes he cannot and encourages her to run away from the Evil Queen.', intensity: 5)

# Creating Permissions
    Permission.create(description: 'login')
    Permission.create(description: 'create-users')
    Permission.create(description: 'create-workouts')
    Permission.create(description: 'view-workouts')
    Permission.create(description: 'view-users')
    Permission.create(description: 'view-personal-clients')
    Permission.create(description: 'view-personal-workouts')

# Assign permissions to roles

    # # Admin
    Role.find(1).permissions << Permission.find(1)
    Role.find(1).permissions << Permission.find(2)
    Role.find(1).permissions << Permission.find(3)
    Role.find(1).permissions << Permission.find(4)
    Role.find(1).permissions << Permission.find(5)

    # # Trainer
    Role.find(2).permissions << Permission.find(1)
    Role.find(2).permissions << Permission.find(2)
    Role.find(2).permissions << Permission.find(3)
    Role.find(2).permissions << Permission.find(6)
    Role.find(2).permissions << Permission.find(7)

    # # Student
    Role.find(3).permissions << Permission.find(1)
    Role.find(3).permissions << Permission.find(4)
    Role.find(3).permissions << Permission.find(7)

    # # Anonymous
    Role.find(4).permissions << Permission.find(4)



