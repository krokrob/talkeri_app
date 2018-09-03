require 'faker'


UserChatroom.destroy_all
UserEvent.destroy_all
AlertSolver.destroy_all
Alert.destroy_all
Message.destroy_all
Chatroom.destroy_all
Event.destroy_all
User.destroy_all


puts 'Creating Users'

emilie = User.create!(
    first_name: "Emilie",
    last_name: "Deschamps-Wright",
    phone_number: Faker::PhoneNumber.cell_phone,
    email: 'e.wright@hotmail.fr',
    password: '123456'
  )
url = "https://avatars1.githubusercontent.com/u/40471401?v=4"
emilie.remote_photo_url = url
emilie.save


# user2pic = Cloudinary::Uploader.upload("image/dark-vador-250.jpg")
sami = User.create!(
    first_name: "Sami",
    last_name: "Bekas",
    phone_number: Faker::PhoneNumber.cell_phone,
    email: 'samibekas@gmail.com',
    password: '123456'
  )
url = "https://avatars0.githubusercontent.com/u/28527656?v=4"
sami.remote_photo_url = url
sami.save


# user3pic = Cloudinary::Uploader.upload("image/donald-trump-feature-0819181.jpg")
arthur = User.create!(
    first_name: "Arthur",
    last_name: "Fleury",
    phone_number: Faker::PhoneNumber.cell_phone,
    email: 'arth.fleury@gmail.com',
    password: '123456'
  )
url = "https://avatars0.githubusercontent.com/u/40490965?v=4"
arthur.remote_photo_url = url
arthur.save


# user4pic = Cloudinary::Uploader.upload("image/poutine117.jpg")
matthieu = User.create!(
    first_name: "Matthieu",
    last_name: "Rousseau",
    phone_number: Faker::PhoneNumber.cell_phone,
    email: 'matt@gmail.com',
    password: '123456'
  )
url = "https://avatars0.githubusercontent.com/u/16851063?v=4"
matthieu.remote_photo_url = url
matthieu.save

# user5pic = Cloudinary::Uploader.upload("image/poutine117.jpg")
jeremy = User.create!(
    first_name: "Jeremy",
    last_name: "Obadia",
    phone_number: Faker::PhoneNumber.cell_phone,
    email: 'jobad@gmail.com',
    password: '123456'
  )
url = "https://avatars2.githubusercontent.com/u/40352550?v=4"
jeremy.remote_photo_url = url
jeremy.save

# user6pic = Cloudinary::Uploader.upload("image/matt.jpg")
noemie = User.create!(
    first_name: "Noémie",
    last_name: "Rauturier",
    phone_number: Faker::PhoneNumber.cell_phone,
    email: 'noemrtr@gmail.com',
    password: '123456',
    photo: "38657615"
  )
url = "https://avatars3.githubusercontent.com/u/37242839?v=4"
noemie.remote_photo_url = url
noemie.save

talkeri = User.create!(
    first_name: 'TalkeriBot',
    email: 'hello@talkeri.io',
    password: '123456'
  )

puts 'Creating Events'

event1 = Event.create!(
  name: "Vivatech",
  start_date: "2018-09-25",
  end_date: "2018-09-28",
  user: emilie
)

puts 'Creating Chatrooms'

secu_chat = Chatroom.create!(
    name: "security",
    instructions: "Event starts at 5pm, be there at 4. Wear black clothes.",
    event: event1
  )
catering_chat = Chatroom.create!(
    name: "catering",
    instructions: "Event starts at 5pm, food must be ready by 4.",
    event: event1
  )


puts 'Creating UserEvents'

user_event1 = UserEvent.create!(
  user: emilie,
  event: event1
  )
user_event2 = UserEvent.create!(
  user: sami,
  event: event1
  )
user_event3 = UserEvent.create!(
  user: arthur,
  event: event1
  )
user_event4 = UserEvent.create!(
  user: matthieu,
  event: event1
  )
user_event5 = UserEvent.create!(
  user: jeremy,
  event: event1
  )
user_event6 = UserEvent.create!(
  user: noemie,
  event: event1
  )

puts 'Creating User Chatroom'

user_chatroom1 = UserChatroom.create!(
  user: emilie,
  chatroom: secu_chat
  )
user_chatroom2 = UserChatroom.create!(
  user: sami,
  chatroom: secu_chat
  )
user_chatroom3 = UserChatroom.create!(
  user: arthur,
  chatroom: secu_chat
  )
user_chatroom4 = UserChatroom.create!(
  user: matthieu,
  chatroom: secu_chat
  )
user_chatroom5 = UserChatroom.create!(
  user: jeremy,
  chatroom: secu_chat
  )
user_chatroom6 = UserChatroom.create!(
  user: noemie,
  chatroom: secu_chat
  )

user_chatroom7 = UserChatroom.create!(
  user: emilie,
  chatroom: catering_chat
  )
user_chatroom8 = UserChatroom.create!(
  user: sami,
  chatroom: catering_chat
  )
user_chatroom9 = UserChatroom.create!(
  user: arthur,
  chatroom: catering_chat
  )
user_chatroom10 = UserChatroom.create!(
  user: matthieu,
  chatroom: catering_chat
  )
user_chatroom11 = UserChatroom.create!(
  user: jeremy,
  chatroom: catering_chat
  )
user_chatroom12 = UserChatroom.create!(
  user: noemie,
  chatroom: catering_chat
  )

