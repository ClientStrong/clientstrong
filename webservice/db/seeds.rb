# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Creating Clients

    Client.create(first_name: 'Snow', last_name: 'White', notes: 'Snow white is a kinda and gentle princess, with lips red as as rose and skin white as sknow.', email: 'snow.white@clientstrong.com', active: true);
    Client.create(first_name: 'Doc', last_name: 'Dwarf', notes: 'Self proclaimed leader of the group, Doc often looses his train of thought and bumbles around, looking over the dwarfs.', email: 'doc.dwarf@clientstrong.com', active: true);
    Client.create(first_name: 'Dopey', last_name: 'Dwarf', notes: 'Although Dopey may annoy Doc & Grumpy, his intentions are silly and he is often the core of the dwarfs jokes.', email: 'dopey.dwarf@clientstrong.com', active: true);
    Client.create(first_name: 'Bashful', last_name: 'Dwarf', notes: 'Being around Snow White increases bashfuls tendency to bury his head but she does not mind.', email: 'bashful.dwarf@clientstrong.com', active: false);
    Client.create(first_name: 'Happy', last_name: 'Dwarf', notes: 'Fat and jolly with a friendly personality, Happy maintains laughter and joy amongst the dwarfs.', email: 'happy.dwarf@clientstrong.com', active: false);
    Client.create(first_name: 'Sleepy', last_name: 'Dwarf', notes: 'While always eager to fall asleep, Sleepy is considered the most observant amongst the dwarfs.', email: 'sleepy.dwarf@clientstrong.com', active: false);
    Client.create(first_name: 'Sneezy', last_name: 'Dwarf', notes: 'A bad case of hayfever causes Sneezy to sneeze violently and frequently but he does not let that stop him from having fun.', email: 'sneezy.dwarf@clientstrong.com', active: true);
    Client.create(first_name: 'Grumpy', last_name: 'Dwarf', notes: 'Grumpy tends to be irritated with the other dwarfs antics and opposes allowing Snow White to stay with them.', email: 'grumpy.dwarf@clientstrong.com', active: true);
    Client.create(first_name: 'Prince', last_name: 'Charming', notes: 'The cure to Snow Whites sleeping death, the Prince finds Snow White in the forest and kisses her to awaken her.', email: 'prince.charming@clientstrong.com', active: true);
    Client.create(first_name: 'The', last_name: 'Queen', notes: 'Due to extreme jealously of Snow White, the Evil Queen plots how to remain the fairest of them all.', email: 'the.queen@clientstrong.com', active: true);
    Client.create(first_name: 'Huntsman', last_name: 'Who', notes: 'Tasked with getting rid of Snow White, the huntsman realizes he cannot and encourages her to run away from the Evil Queen.', email: 'huntsman.who@clientstrong.com', active: true);

# Creating Roles

    Role.create(name: 'admin', description: 'access to all profiles, all lists')
    Role.create(name: 'trainer', description: 'access to all their client profiles')
    Role.create(name: 'student', description: 'access to their profile, their own workouts')
    Role.create(name: 'anonymous', description: 'have access to unprotected areas')

# Assigning roles to Clients

    # Admin
    Client.first.roles << Role.first

    # #Trainer
    Client.find(2).roles << Role.find(2)
    Client.find(3).roles << Role.find(2)

    # #Student
    Client.find(4).roles << Role.find(3)
    Client.find(5).roles << Role.find(3)
    Client.find(6).roles << Role.find(3)
    Client.find(7).roles << Role.find(3)
    Client.find(8).roles << Role.find(3)
    Client.find(9).roles << Role.find(3)

    # #Anonymous
    Client.find(10).roles << Role.find(4)
    Client.find(11).roles << Role.find(4)
