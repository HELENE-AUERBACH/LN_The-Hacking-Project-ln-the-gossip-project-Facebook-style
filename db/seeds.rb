# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'bcrypt'

ActiveRecord::Base.connection.tables.each do |table|
  if table != "ar_internal_metadata" && table != "schema_migrations"
    puts "Resetting auto increment ID for #{table} to 1"
    ActiveRecord::Base.connection.execute("ALTER SEQUENCE #{table}_id_seq RESTART WITH 1")
  end
end
JoinTableTagGossip.destroy_all
JoinTableRecipientPm.destroy_all
Comment.destroy_all
PrivateMessage.destroy_all
Tag.destroy_all
Gossip.destroy_all
City.destroy_all
User.destroy_all

users_array = []
cities_array = []
gossips_array = []
tags_array = []
pms_array = []
comments_array = []

Faker::Config.locale = 'fr'

puts "\nCréation d'un utilisateur de prénom, de nom et de password \"Anonymous\", qui a pour email \"anonymous@gmail.com\" et qui habite Paris (75000)."
anonymous_user = User.new(first_name: "Anonymous",
                          last_name: "Anonymous",
                          description: "Utilisateur créé afin qu'il soit l'auteur associé à tous les potins créés dans l'application via la view new. C'est donc un Anonyme Anonyme.",
                          email: "anonymous@gmail.com",
                          age: Faker::Number.between(from: 14, to: 107),
                          password: "Anonymous"
                         )
users_array << anonymous_user

city = City.new(name: "Paris",
                zip_code: "75000"
               )
cities_array << city
city.save

anonymous_user.city = city
anonymous_user.save

puts "\nCet Anonymous écrit deux potins avec le même tag \"#By_Anonymous\" - et il les \"taggue\" aussi de manière \"individuelle\" -, puis chacun des potins est commenté une fois par Anonymous, et il envoie aussi un message privé dont il est à la fois l'expéditeur et l'un des destinataires (il est \"en copie\")."

tag0 = Tag.new(title: "#By_Anonymous")
tags_array << tag0
tag0.save

gossip1 = Gossip.new(title: "Test potin n°1",
                     content: "Ceci est le premier test de création d'un potin par Anonymous via le seed."
                    )
gossip1.author = anonymous_user
gossips_array << gossip1
gossip1.save

JoinTableTagGossip.new(gossip: gossip1, tag: tag0).save

tag1 = Tag.new(title: "#Fabulous")
tags_array << tag1
tag1.save

JoinTableTagGossip.new(gossip: gossip1, tag: tag1).save

gossip2 = Gossip.new(title: "Test potin n°2",
                     content: "Ceci est le second test de création d'un potin par Anonymous via le seed."
                    )
gossip2.author = anonymous_user
gossips_array << gossip2
gossip2.save

JoinTableTagGossip.new(gossip: gossip2, tag: tag0).save

tag2 = Tag.new(title: "#Ridiculous")
tags_array << tag2
tag2.save

JoinTableTagGossip.new(gossip: gossip2, tag: tag2).save

comment1 = Comment.new(content: "Ceci est le premier test de création d'un commentaire via le seed et je l'écris à propos de mon premier potin.")
comment1.author = anonymous_user
comment1.gossip = gossip1
comments_array << comment1
comment1.save

comment2 = Comment.new(content: "Ceci est le second test de création d'un commentaire via le seed et je l'écris à propos de mon second potin.")
comment2.author = anonymous_user
comment2.gossip = gossip2
comments_array << comment2
comment2.save

pm0 = PrivateMessage.new(content: "Ceci est le premier test d'envoi d'un message privé par Anonymous via le seed.\nEt je me l'envoie aussi en copie pour être sûr!")
pm0.sender = anonymous_user
pms_array << pm0
pm0.save

JoinTableRecipientPm.new(private_message: pm0, recipient: anonymous_user).save

puts "\nGénération plus aléatoire :"

n = 10

n.times do |index|
  first_name = Faker::Name.unique.first_name
  last_name = Faker::Name.unique.last_name
  email = "#{first_name}_#{last_name}@gmail.com"
  password = Faker::Internet.password(min_length: 6, max_length: 10)
  puts "\nLe password du #{index + 2}-ième utilisateur - de prénom \"#{first_name}\", de nom \"#{last_name}\" et d'email \"#{email}\" - créé par ce seed sera : \"#{password}\"."
  user = User.new(first_name: "#{first_name}",
                  last_name: "#{last_name}",
                  description: ("#{first_name} #{last_name} est une #{index}-ième personne (de password \"#{password}\") : " + Faker::Lorem.characters(number: 115)),
                  email: "#{email}",
                  age: Faker::Number.between(from: 14, to: 107),
                  password: password
                 )
  users_array << user

  city = City.new(name: Faker::Address.unique.city,
                  zip_code: (Faker::Number.between(from: 21, to: 95).to_s + Faker::Number.between(from: 100, to: 999).to_s)
                 )
  cities_array << city

  user.city = city

  user.save
  city.save
end
  
user_ids_array = (2..users_array.length).to_a

id = user_ids_array.sample
puts "\nChoix aléatoire d'un \"vrai\" destinataire pour le message privé envoyé par Anonymous : ce sera #{users_array[id - 1].first_name} #{users_array[id - 1].last_name} (#{id})."
JoinTableRecipientPm.new(private_message: pm0, recipient: users_array[id - 1]).save

puts

gossips1_author_ids_array = []
gossips2_author_ids_array = []
#gossip_ids_array = (3..22).to_a
n.times do |index|
  gossip1 = Gossip.new(title: Faker::Lorem.characters(number: 7).capitalize,
                       content: Faker::Lorem.sentences(number: rand(4)+1).join(' ')
                      )
  gossips_array << gossip1

  author_id = (user_ids_array - gossips1_author_ids_array).sample # choix aléatoire d'un Id parmi ceux qui n'ont pas encore été choisis
  puts "gossip#{index * 2 + 3} author.id : #{author_id}"
  gossip1.author = users_array[author_id - 1] # -1 car un index d'Array commence à 0 (contrairement à un id d'une séquence en auto-increment)
  gossips1_author_ids_array << author_id 
  gossip1.save

  gossip2 = Gossip.new(title: Faker::Lorem.characters(number: 7).capitalize,
                       content: Faker::Lorem.sentences(number: rand(4)+1).join(' ')
                      )
  gossips_array << gossip2

  author_id = (user_ids_array - gossips2_author_ids_array).sample # choix aléatoire d'un Id parmi ceux qui n'ont pas encore été choisis
  puts "gossip#{index * 2 + 4} author.id : #{author_id}"
  gossip2.author = users_array[author_id - 1]
  gossips2_author_ids_array << author_id 
  gossip2.save

  tag = Tag.new(title: "#" + Faker::Lorem.word)
  tags_array << tag
  tag.save

  JoinTableTagGossip.new(gossip: gossip1, tag: tag).save
  JoinTableTagGossip.new(gossip: gossip2, tag: tag).save

  comment1 = Comment.new(content: Faker::Lorem.sentences(number: rand(4)+1).join(' '))
  comment1.author = users_array[user_ids_array.sample - 1]
  comment1.gossip = gossip1
  comments_array << comment1
  comment1.save

  comment2 = Comment.new(content: Faker::Lorem.sentences(number: rand(4)+1).join(' '))
  comment2.author = users_array[user_ids_array.sample - 1]
  comment2.gossip = gossip2
  comments_array << comment2
  comment2.save

  pm = PrivateMessage.new(content: Faker::Lorem.sentences(number: rand(4)+1).join(' '))
  pm.sender = users_array[user_ids_array.sample - 1]
  pms_array << pm
  pm.save
  
  JoinTableRecipientPm.new(private_message: pm, recipient: users_array[user_ids_array.sample - 1]).save
end

#User.all
#City.all
#Gossip.all
#Tag.all
#PrivateMessage.all
#Comment.all

require 'table_print'

tp.set User, :id, :first_name, :last_name, :email, :age, "city.name", "city.zip_code", :description
tp.set Tag, :id, :title
tp.set Gossip, :id, :title, "author.first_name", "author.last_name", "tags.title", :content
tp.set PrivateMessage, :id, "sender.first_name", "sender.last_name", "recipients.first_name", "recipients.last_name", :content
tp.set Comment, :id, "author.first_name", "author.last_name", "gossip.title", :content

puts "\n#{users_array.length} users créés :\n"
tp User.all
puts "\n#{cities_array.length} cities créées :\n"
tp City.all
puts "\n#{gossips_array.length} gossips créés :\n"
tp Gossip.all
puts "\n#{tags_array.length} tags créés :\n"
tp Tag.all
puts "\n#{pms_array.length} private messages créés :\n"
tp PrivateMessage.all
puts "\n#{comments_array.length} comments créés :\n"
tp Comment.all
puts
