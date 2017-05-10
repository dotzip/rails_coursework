  if (u1 = User.find_by_email('admin@localhost')).nil?
  u1 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'admin@localhost')
  u1.activate!
end
if (u2 = User.find_by_email('user@localhost')).nil?
  u2 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'user@localhost')
  u2.activate!
end

r1, r2 = Role.create_main_roles
ru1 = RoleUser.create(role: r1, user: u1)
ru2 = RoleUser.create(role: r2, user: u2)

Item.delete_all
Stack.delete_all
Room.delete_all
Client.delete_all

for i in 0..5

	Room.create(name: 'room' + i.to_s, volume: rand(50))
	Stack.create(number: i, places: rand(Range.new(5, 13)), width: (i+0.3).to_f, height: (i+0.5).to_f, depth: (i).to_f, max_total_load: rand(Range.new(5, 10)), room_id: Room.all[i].id) 
	Client.create(entity_name: 'ENTITY' + i.to_s, bank_details: 'BANK DETAILS FOR EACH ENTITY')
	Item.create(width: (i+0.3).to_s, height: (i+0.5).to_f, depth: (i).to_f, weight: rand(25).to_f, receipt_date: "2000-03-24", contract_number: rand(100), place: i+4, contract_expiry_date: "2001-05-11", stack_id: Stack.all[i].id, client_id: Client.all[i].id)

end