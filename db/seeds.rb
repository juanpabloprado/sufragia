# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


u1 = User.create({
     zip_code: "64638",
	 password: "123456",
	 password_confirmation: "123456",
	 phone_number: "8180509602",
	 phone_confirmation_token: 1234, 
	 confirmed_at: Date::today()
	})

u2 = User.create({
     zip_code: "64638",
	 password: "123456",
	 password_confirmation: "123456",
	 phone_number: "1234567890",
	 phone_confirmation_token: 1234, 
	 confirmed_at: Date::today()
	})

u3 = User.create({
     zip_code: "64638",
	 password: "123456",
	 password_confirmation: "123456",
	 phone_number: "1231231234",
	 phone_confirmation_token: 1234, 
	 confirmed_at: Date::today()
	})

u4 =  User.create({
     zip_code: "64638",
	 password: "123456",
	 password_confirmation: "123456",
	 phone_number: "1231231238",
	 phone_confirmation_token: 1234, 
	 confirmed_at: Date::today()
	})

u5 =  User.create({
     zip_code: "64638",
	 password: "123456",
	 password_confirmation: "123456",
	 phone_number: "1231231233",
	 phone_confirmation_token: 1234, 
	 confirmed_at: Date::today()
	})


u6 =  User.create({
     zip_code: "64638",
	 password: "123456",
	 password_confirmation: "123456",
	 phone_number: "1231231233",
	 phone_confirmation_token: 1234, 
	 confirmed_at: Date::today()
	})

c1 = Campaign.create({name: "A quién está apuntada la Ley3de3?", 
					 category: "Opinión Cívica", 
					 description: "this is a campaign", 
					 user: u1, 
					 segments: {}, 
					 expiration_date: Date::tomorrow})

Option.create({option: "Ciudadanos", description: "", campaign: c1})
Option.create({option: "Políticos", description: "", campaign: c1})
Option.create({option: "", description: "", campaign: c1})


Vote.create(option: c1.options.first, user: u2)
Vote.create(option: c1.options.first, user: u3)
Vote.create(option: c1.options.last, user: u4)
Vote.create(option: c1.options.second, user: u5)
Vote.create(option: c1.options.second, user: u6)

c1 = Campaign.create({name: "¿Quién debería ser el próximo presidente?", 
					 category: "Democracia", 
					 description: "this is a campaign", 
					 user: u1, 
					 segments: {}, 
					 expiration_date: Date::tomorrow})

Option.create({option: "Miguel Angel Mancera", description: "", campaign: c1})
Option.create({option: "Manuel Velasco Coello", description: "", campaign: c1})
Option.create({option: "Margarita Zavala", description: "", campaign: c1})
Option.create({option: "Denisse Dresser", description: "", campaign: c1})


Vote.create(option: c1.options.first, user: u2)
Vote.create(option: c1.options.second, user: u3)
Vote.create(option: c1.options[2], user: u5)
Vote.create(option: c1.options.second, user: u6)

c1 = Campaign.create({name: "¿Deberíamos evaluar a los profesores?", 
					 category: "Opinión Cívica", 
					 description: "this is a campaign", 
					 user: u1, 
					 segments: {}, 
					 expiration_date: Date::tomorrow})

Option.create({option: "Sí, hay que evaluarlos", description: "", campaign: c1})
Option.create({option: "No, no es necesario", description: "", campaign: c1})


Vote.create(option: c1.options.first, user: u2)
Vote.create(option: c1.options.first, user: u3)
Vote.create(option: c1.options.first, user: u4)
Vote.create(option: c1.options.first, user: u5)
Vote.create(option: c1.options.first, user: u6)




