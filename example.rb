# First part #################################################################

def ruby_in_twenty_min

	puts "Hello world"

	puts '2+3 = ' + (2 + 3).to_s
	puts '3*2 = ' + (3 * 2).to_s
	puts '2**3 = ' + (2 ** 3).to_s
	puts 'Math.sqrt(9) = ' + Math.sqrt(9).to_s

	a = 3 ** 2
	b = 4 ** 2
	puts "Math.sqrt(a (#{a}) + b (#{b})) = " + Math.sqrt(a +  b).to_s

end
ruby_in_twenty_min


# Second part #################################################################

def h(name = 'World')
	puts "Hello #{name.capitalize}"
end

class Hello
	attr_accessor :name

	def initialize(name = 'World')
		@name = name
	end
	def say_hi
		puts "Hi #{@name}!"
	end
	def say_bye
		puts "Bye #{@name}, come back soon."
	end
end

user = Hello.new('Jhon')
user.say_hi
user.say_bye

puts Hello.instance_methods(false)

puts user.respond_to?('name')
puts user.respond_to?('name=')
puts user.respond_to?('say_hi')
puts user.respond_to?('to_s')

user.name = 'Andy'
puts 'new user name = ' + user.name.to_s
user.say_hi

#--------------------------------------------------------------

class MegaHi
	attr_accessor :names

	@foo = lambda { |n| 
		n + 10 if n.instance_of?(Fixnum) 
	}
    
	#create the object
	def initialize(names = 'World')
		@names = names
	end

	#say Hi to everybody
	def say_hi
		if @names.nil?
			puts '...'
		elsif @names.respond_to?('each')
			#names is a list of some kind
			@names.each do |name|
				puts "Hello #{name}!"
			end
		else
			puts "Hello #{names}!"
		end
	end

	def say_bye
		if @names.nil?
			puts '...'
		elsif @names.respond_to?('join')
			puts "Goodbye #{names.join(', ')}. Come back soon!"
		else
			puts "Goodbye #{names}. Come back soon!"
		end			
	end

	def self.say_hi
		puts 'Static method'
		puts @foo.call(10).to_s
	end

end

mh = MegaHi.new
mh.say_hi
mh.say_bye

#change name
mh.names = 'Smith'
mh.say_hi
mh.say_bye

#name -> array
mh.names = ['Andy', 'Jhon', 'Smith', 'Joi']
mh.say_hi
mh.say_bye

#change name to nil
mh.names = nil
mh.say_hi
mh.say_bye

MegaHi.say_hi

Kernel.const_get("MegaHi").send(:say_hi)