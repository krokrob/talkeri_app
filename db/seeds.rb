require 'faker'


UserChatroom.destroy_all
UserEvent.destroy_all
Alert.destroy_all
Message.destroy_all
Chatroom.destroy_all
Event.destroy_all
User.destroy_all


puts 'Creating Users'

user1 = User.create(
    first_name: "Emilie",
    last_name: "Deschamps-Wright",
    phone_number: Faker::PhoneNumber.cell_phone,
    email: 'e.wright@hotmail.fr',
    password: '123456',
    photo: 'image/upload/v1535389744/aowv0vfryc5i5z6g3owc.jpg'
  )
user2 = User.create(
    first_name: "Sami",
    last_name: "Bekas",
    phone_number: Faker::PhoneNumber.cell_phone,
    email: 'samibekas@gmail.com',
    password: '123456',
    photo: 'image/upload/v1535389744/aowv0vfryc5i5z6g3owc.jpg'
  )
user3 = User.create(
    first_name: "Arthur",
    last_name: "Fleury",
    phone_number: Faker::PhoneNumber.cell_phone,
    email: 'arth.fleury@gmail.com',
    password: '123456',
    photo: 'image/upload/v1535389744/aowv0vfryc5i5z6g3owc.jpg'
  )
user4 = User.create(
    first_name: "Matthieu",
    last_name: "Rousseau",
    phone_number: Faker::PhoneNumber.cell_phone,
    email: 'Matthieu.rousseau@gmail.com',
    password: '123456',
    photo: 'image/upload/v1535389744/aowv0vfryc5i5z6g3owc.jpg'
  )
user5 = User.create(
    first_name: "Jeremy",
    last_name: "Obadia",
    phone_number: Faker::PhoneNumber.cell_phone,
    email: 'jobad@gmail.com',
    password: '123456',
    photo: 'image/upload/v1535389744/aowv0vfryc5i5z6g3owc.jpg'
  )
user6 = User.create(
    first_name: "Noémie",
    last_name: "Rauturier",
    phone_number: Faker::PhoneNumber.cell_phone,
    email: 'noemrtr@gmail.com',
    password: '123456',
    photo: 'image/upload/v1535389744/aowv0vfryc5i5z6g3owc.jpg'
  )


puts 'Creating Events'

event1 = Event.create(
  name: "Vivatech",
  start_date: "2018-09-25",
  end_date: "2018-09-28"
)

puts 'Creating Chatrooms'

secu_chat = Chatroom.create(
    name: "security",
    instructions: "Event starts at 5pm, be there at 4. Wear black clothes.",
    event_id: Event.find_by(name: 'Vivatech').id
  )
catering_chat = Chatroom.create(
    name: "catering",
    instructions: "Event starts at 5pm, food must be ready by 4.",
    event_id: Event.find_by(name: 'Vivatech').id
    )


puts 'Creating UserEvents'

user_event1 = UserEvent.create(
  user_id: User.find_by(first_name: 'Emilie').id,
  event_id: Event.find_by(name: 'Vivatech').id
  )
user_event2 = UserEvent.create(
  user_id: User.find_by(first_name: 'Sami').id,
  event_id: Event.find_by(name: 'Vivatech').id,
  )
user_event3 = UserEvent.create(
  user_id: User.find_by(first_name: 'Arthur').id,
  event_id: Event.find_by(name: 'Vivatech').id,
  )
user_event4 = UserEvent.create(
  user_id: User.find_by(first_name: 'Matthieu').id,
  event_id: Event.find_by(name: 'Vivatech').id,
  )
user_event5 = UserEvent.create(
  user_id: User.find_by(first_name: 'Jeremy').id,
  event_id: Event.find_by(name: 'Vivatech').id,
  )
user_event6 = UserEvent.create(
  user_id: User.find_by(first_name: 'Noémie').id,
  event_id: Event.find_by(name: 'Vivatech').id,
  )

puts 'Creating User Chatroom'

user_chatroom1 = UserChatroom.create(
  user_id: User.find_by(first_name: 'Emilie').id,
  chatroom_id: Chatroom.find_by(name: 'security').id,
  )
user_chatroom2 = UserChatroom.create(
  user_id: User.find_by(first_name: 'Sami').id,
  chatroom_id: Chatroom.find_by(name: 'security').id,
  )
user_chatroom3 = UserChatroom.create(
  user_id: User.find_by(first_name: 'Arthur').id,
  chatroom_id: Chatroom.find_by(name: 'catering').id,
  )
user_chatroom4 = UserChatroom.create(
  user_id: User.find_by(first_name: 'Matthieu').id,
  chatroom_id: Chatroom.find_by(name: 'catering').id,
  )
user_chatroom5 = UserChatroom.create(
  user_id: User.find_by(first_name: 'Jeremy').id,
  chatroom_id: Chatroom.find_by(name: 'catering').id,
  )
user_chatroom6 = UserChatroom.create(
  user_id: User.find_by(first_name: 'Noémie').id,
  chatroom_id: Chatroom.find_by(name: 'security').id,
  )


puts 'Creating Messages'

message1 = Message.create(
  user_id: User.find_by(first_name: 'Emilie').id,
  chatroom_id: Chatroom.find_by(name: 'security').id,
  content: Faker::Lorem.sentence,
  )
message2 = Message.create(
  user_id: User.find_by(first_name: 'Sami').id,
  chatroom_id: Chatroom.find_by(name: 'security').id,
  content: Faker::Lorem.sentence,
  )
message3 = Message.create(
  user_id: User.find_by(first_name: 'Arthur').id,
  chatroom_id: Chatroom.find_by(name: 'catering').id,
  content: Faker::Lorem.sentence,
  )
message4 = Message.create(
  user_id: User.find_by(first_name: 'Matthieu').id,
  chatroom_id: Chatroom.find_by(name: 'catering').id,
  content: Faker::Lorem.sentence,
  )


puts 'Creating Alerts'

alert1 = Alert.create(
  chatroom_id: Chatroom.find_by(name: 'security').id,
  user_id: User.find_by(first_name: 'Sami').id,
  content: "fight at main entrance"
  )
alert2 = Alert.create(
  chatroom_id: Chatroom.find_by(name: 'catering').id,
  user_id: User.find_by(first_name: 'Arthur').id,
  content: "Guest arriving"
  )
