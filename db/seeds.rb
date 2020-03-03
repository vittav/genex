require 'faker'


Experience.destroy_all
puts "Destroyed all experiences"

User.destroy_all
puts "Destroyed all users"

LANGUAGES = ["English", "Portuguese", "French", "Spanish", "German"]
LEVEL = ["Bad", "Regular", "Good", "Very Good", "Excellent"]
SKILLS = ["Woodcraft", "Speech", "Cooking", "Football tactics"]

puts "Starting creation of base users"
user1 = User.new(
    email: "cirolas@lewagon.com",
    first_name: "Cirolas",
    last_name: Faker::Name.last_name,
    age: rand(18..90),
    location: Faker::Address.city,
    occupation: Faker::Job.title,
    civil_state: ["Married", "Single", "Widowed", "Divorced"].sample,
    password: "12345678"
    )
  user1.save!
puts "User Created"

user2 = User.new(
    email: "nicoliro@lewagon.com",
    first_name: "Nicoliro",
    last_name: Faker::Name.last_name,
    age: rand(18..90),
    location: Faker::Address.city,
    occupation: Faker::Job.title,
    civil_state: ["Married", "Single", "Widowed", "Divorced"].sample,
    password: "12345678"
    )
  user2.save!
puts "User Created"






puts "Creating 10 experiences"

seeds = [
{location: "Buenos Aires", gender: "Male", img_url: "https://res.cloudinary.com/caiazzo14/image/upload/v1583257961/seed%20test%20le%20wagon/old_guy_1_iqdle4.jpg"},
{location: "Berlin", gender: "Male", img_url: "https://res.cloudinary.com/caiazzo14/image/upload/v1583257961/seed%20test%20le%20wagon/old_guy_2_l9q4if.jpg"},
{location: "Tokyo", gender: "Male", img_url: "https://res.cloudinary.com/caiazzo14/image/upload/v1583257961/seed%20test%20le%20wagon/old_guy_3_gc0odz.jpg"},
{location: "Tel Aviv", gender: "Male", img_url: "https://res.cloudinary.com/caiazzo14/image/upload/v1583257961/seed%20test%20le%20wagon/old_guy_4_cb3e2j.jpg"},
{location: "London", gender: "Male", img_url: "https://res.cloudinary.com/caiazzo14/image/upload/v1583257961/seed%20test%20le%20wagon/old_guy_5_ahsbly.jpg"},
{location: "Mexico", gender: "Female", img_url: "https://res.cloudinary.com/caiazzo14/image/upload/v1583257961/seed%20test%20le%20wagon/old_woman_1_ijxngy.jpg"},
{location: "Paris", gender: "Female", img_url: "https://res.cloudinary.com/caiazzo14/image/upload/v1583257961/seed%20test%20le%20wagon/old_woman_2_q40i8u.jpg"},
{location: "Lisbon", gender: "Female", img_url: "https://res.cloudinary.com/caiazzo14/image/upload/v1583257962/seed%20test%20le%20wagon/old_woman_3_pnxzir.jpg"},
{location: "Rio de Janeiro", gender: "Female", img_url: "https://res.cloudinary.com/caiazzo14/image/upload/v1583257961/seed%20test%20le%20wagon/old_woman_4_j9lo76.jpg"},
{location: "Belo Horizonte", gender: "Female", img_url: "https://res.cloudinary.com/caiazzo14/image/upload/v1583257962/seed%20test%20le%20wagon/old_woman_5_b4ieia.jpg"}
]


seeds.each do |seed|
  experience = Experience.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    gender: seed[:gender],
    age: rand(65..90),
    location: seed[:location],
    user: User.all.sample,
    img_url: seed[:img_url]
    )
  experience.save!
  language = Language.new(experience_id: experience.id, name: LANGUAGES.sample, level: LEVEL.sample)
  language.save!
  skill = Skill.new(experience_id: experience.id, name: SKILLS.sample, level: LEVEL.sample, description: "veiote's ability")
  skill.save!
end

puts "10 experiences created successfully"






# ==============================================================
# puts "Creating 30 experiences"

# 30.times do
#   experience = Experience.new(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     gender: Faker::Gender.binary_type,
#     age: rand(65..90),
#     location: Faker::Address.city,
#     user: User.all.sample
#     )
#   experience.save!
#   language = Language.new(experience_id: experience.id, name: LANGUAGES.sample, level: LEVEL.sample)
#   language.save!
#   skill = Skill.new(experience_id: experience.id, name: SKILLS.sample, level: LEVEL.sample, description: "veiote's ability")
#   skill.save!
# end

# puts "30 experiences created successfully"

