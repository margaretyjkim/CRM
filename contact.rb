class Contact
	attr_reader :id
	attr_accessor :first_name, :last_name, :email, :notes
	#CLASS VARIABLE = DEFINE IN THE WHOLE CONTACTS
	@@contacts = []
	@@id = 1
	# attr_accessor creates these getter and setter
	# GETTER
	# def first_name
	# 	@first_name
	# end
	# SETTER
	# def first_name=(new_first_name)
	# 	@first_name = new_first_name
	# end
	def initialize(first_name, last_name, email, notes) #make a hash so that you can extend more and get nil if you dont have the info
		@first_name = first_name
		@last_name = last_name
		@email = email
		@notes = notes

		@id = @@id
		@@id += 1
	end
	#self - refers to the object itself and in this case, it's the class that you are referring to
	def self.create(first_name, last_name, email, notes)
		new_contact = Contact.new(first_name, last_name, email, notes) #same thing as new_contact = new(first_name, last_name, options)

		@@contacts << new_contact
		return new_contact
	end

	def self.all #class method
		@@contacts
	end

	def self.find(id) #class method
		contacts = @@contacts.select do |contact|
			contact.id == id
		end

		contacts.first
	end

	def display_first_name(first_name)
		@@contacts.each do |first_name|
			if contact.first_name = first_name
				return contact
			end
		end
	end

	def self.search_by_attribute(attribute, value)
		list = []
		@@contacts.each do |contact|
			if attribute == "first_name"
				if value == contact.first_name
					list << contact
				end
			elsif attribute == "last_name"
				if value == contact.last_name
					list << contact
				end
			elsif attribute == "email"
				if value == contact.email
					list << contact
				end
			elsif attribute == "notes"
				if value == contact.notes
					list << contact
				end
			end
		end
		return list
	end

	def self.delete_contact(user_specified_id)
		@@contacts.delete_if { |contact| contact.id == user_specified_id }
	end

	def self. delete_all
		@@contacts = []
		@@id = 1
	end

	# This a more advanced way of updating
	def update(field, new_value)
		self.send("#{field}=", new_value)
	end

	def full_name
		"#{first_name} #{last_name}"
	end

end