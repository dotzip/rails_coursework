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

Room.delete_all
Stack.delete_all
Item.delete_all
Client.delete_all



for i in 0..5

	my_date = Date.new(2009+i, rand(12), rand(28))

	Room.create(name: 'room' + i.to_s, volume: rand(50))
	Stack.create(number: i, places: rand(Range.new(5, 13)), width: (i+0.3).to_f, height: (i+0.5).to_f, depth: (i).to_f, max_total_load: rand(Range.new(5, 10))) 
	Item.create(width: (i+0.3).to_s, height: (i+0.5).to_f, depth: (i).to_f, weight: rand(25).to_f, receipt_date: my_date, contract_number: rand(100), place: i+4, contract_expiry_date: my_date)
	Client.create(entity_name: 'ENTITY' + i.to_s, bank_details: 'BANK DETAILS FOR EACH ENTITY')

	#### References ####
	#Stack.all[i].room << Room.all[i]
	#Item.all[i].stack << Stack.all[i]
	#Item.all[i].client << Client.all[i]
end