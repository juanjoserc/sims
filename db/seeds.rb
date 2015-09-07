# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
TicketStatus.destroy_all
Service.destroy_all
TicketStatus.create!(name: 'Pending Tech Assignment')
TicketStatus.create!(name: 'Open')
TicketStatus.create!(name: 'Closed')
Service.create!([{
		name: 'Armory Services',
		description: 'Provides all the weaponry and ammunition needed for a mission.'
	},
	{
		name:'Transportation Services',
		description:'Provides vehicles and transportation services during a mission.'
	},
	{
		name:'Special Devises Services',
		description:'You know, from phone shoes to c4 bubble gum.'
	}

])

10.times do |i|
  Service.create(name: "Service id:#{i}", description: "Sample Service #{i}")
end


p "Ticket status created: #{TicketStatus.count}. Services created: #{Service.count}"