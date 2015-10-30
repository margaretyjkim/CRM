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
	def initialize(first_name, last_name, options = {}) #make a hash so that you can extend more and get nil if you dont have the info
		@first_name = first_name
		@last_name = last_name
		@email = options[:email]
		@notes = options[:notes]

		@id = @@id
		@@id += 1
	end
	#self - refers to the object itself and in this case, it's the class that you are referring to
	def self.create(first_name, last_name, options = {})
		new_contact = Contact.new(first_name, last_name, options) #same thing as new_contact = new(first_name, last_name, options)

		@@contacts << new_contact
	end

	def self.all #class method
		@@contacts
	end

	def self.find(id) #class method
		@@contacts.each do |contact|
			if contact.id = id
				return contact
			end
		end
	end

	# This a more advanced way of updating
	def update(field, new_value)
		self.send("#{field}=", new_value)
	end

	def full_name
		"#{first_name} #{last_name}"
	end

end

