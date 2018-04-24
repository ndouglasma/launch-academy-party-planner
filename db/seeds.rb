# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')

Party.create(name: "Puppy Party", description: "1st Launch Academy Doggie Get Together", location: "Boston Common - Boston, MA")
Party.create(name: "1990s Party", description: "Let Us Celebrate All Things 1990", location: "Launch Academy - Boston, MA")
Party.create(name: "Poros Birthday Party", description: "2nd Birthday Party for Launch Academy Poros", location: "Launch Academy - Boston, MA")

Friend.create(first_name: 'Evan', last_name: 'Hagberg')
Friend.create(first_name: 'Jacob', last_name: 'Atamian')
Friend.create(first_name: 'Anne', last_name: 'Beaupre')
Friend.create(first_name: 'Natalie', last_name: 'Douglas')

Invitation.create(party_id: 1, friend_id: 1, rsvp: true)
Invitation.create(party_id: 1, friend_id: 4, rsvp: true)
Invitation.create(party_id: 2, friend_id: 1, rsvp: true)
Invitation.create(party_id: 2, friend_id: 2, rsvp: true)
Invitation.create(party_id: 2, friend_id: 3, rsvp: false)
