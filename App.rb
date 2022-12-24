require_relative './base_decorator'
require './book'
require './capitalize_decorator'
require './classroom'
require './nameable'
require './person'
require './rental'
require './student'
require './teacher'
require './trimmer_decorator'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def user_interface
    puts 'Press the key to choose an option'
    puts 'Press 1 to List all books'
    puts 'Press 2 to List all people'
    puts 'Press 3 to List Rentals'
    puts 'Press 4 to Create a book'
    puts 'Press 5 to Create a person'
    puts 'Press 6 to Create a rental'
    puts 'Press 7 to List Rentals of a Person'
    puts 'Press 0 to Exit'
  end

  def exit_app
    print 'Thank you for using the App. Give a like on Github.'
    exit
  end

  def start_app
    puts 'Hello User. Welcome to the school Library.'
    puts 'What would you like to do today?'

    userChoices = {
      0 => :exit_app,
      1 => :list_books,
      2 => :list_people,
      3 => :list_rentals,
      4 => :create_book,
      5 => :create_person,
      6 => :create_rental,
      7 => :list_specific_rentals
    }
  
    loop do
      user_interface
      userChoice = gets.chomp.to_i
      # Select the method to run
      option = userChoices[userChoice]
      if option == :exit_app
        print 'Thank you for using the App. Give a like on Github.'
        break
      elsif option
        send(option)
      else
        puts 'Invalid Input. Dude, select the correct one'
      end
    end
  end

  def list_books
    puts 'Listing books. Please Wait'
    if @books.empty?
      puts 'The library is currently empty. Be the first to add a book'
    else
      @books.each{ |book| puts "Title: #{book.title}, Author: #{book.author}"}
    end
  end

  def list_people
    puts 'Listing people. Please Wait'
    if @people.empty?
      puts 'There are currently no persons in the library. That makes you the first'
    else
      @people.each { |person| puts "Name: #{person.name}, Age: #{person.age}, ID: #{person.id}, Profession: #{person.class}"}
    end
  end

  def list_rentals
    puts 'Listing rentals. Plese Wait'
    if @rentals.empty?
      puts 'There are no avaliable rentals. Make the first one'
    else
      @rentals.each { |rental| puts "id: #{rental.id}, Title: #{rental.book.title}, Name: #{rental.book.author}" }
    end
  end

  def list_specific_rentals
    puts 'Enter User ID'
    id = gets.chomp.to_i
    puts '..............................'
    puts 'Loading. Please Wait...' 
    puts "These are Rentals made by User with id of #{id}"
    @people.each do |person| next unless person.id == id

      person.rentals.each do |rental| puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
      end
    end
  end

  def create_book
    puts 'Create a book'
    puts '---------------'
    puts '---------------'
    puts 'Enter Book Title: ...'
    title = gets.chomp.to_s
    puts 'Enter Book Author:...'
    author = gets.chomp.to_s
    book = Book.new(title, author)
    puts 'Book Created Sucessfully'
    @books.push(book)
  end

  def create_person
    puts 'Create a person'
    puts 'Who would you like to create?'
    puts 'Press 1 to create a Student.'
    puts 'Press 2 to create a Teacher.'
    option = gets.chomp.to_i
    case option
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def create_student
    puts 'Welcome to the Create Students section'
    puts '....'
    puts '....'
    puts 'Enter Student Age: ....'
    age = gets.chomp.to_i
    puts '...........................'
    puts 'Enter Student Name:...'
    name = gets.chomp
    puts '...........................'
   puts 'Do you have Parental Permission?'
    perm = gets.chomp
    case perm
    when 'y','Y'
      perm = true
    when 'n', 'N'
      perm = false
    end
    student = Student.new(age, name, perm)
    puts 'Student Created Sucessfully'
    @people.push(student)
  end

  def create_teacher
    puts 'Welcome to the Create Teacher section'
    puts '...'
    puts '...'
    puts 'Enter Teacher\'s Age:...'
    age = gets.chomp
    puts '...............................'
    puts 'Enter Teacher\'s Name:...'
    name = gets.chomp
    puts '...............................'
    puts 'Enter your area of Expertise'
    specialization = gets.chomp
    teacher = Teacher.new(age, name, specialization)
    puts 'Teacher Created Sucessfully'
    @people.push(teacher)
  end

  def create_rental
    puts 'Welcome to the Create Rental section'
    puts 'Please select which book you want to rent'
    if @books.empty?
      puts 'The books list is empty'
    else
      @books.each_with_index { |book, index| puts "#{index} - Title: #{book.title}, Author: #{book.author}" }
    end
    chosen_book = gets.chomp.to_i
    puts '......................................'
    puts 'Please Select your name: '
    @people.each_with_index {|person, index| puts "#{index} -  Name: #{person.name}, ID: #{person.id}, Age: #{person.age}, #{person.class}" }
    person = gets.chomp.to_i
    puts '.....................'
    puts 'Enter Date of Renting:'
    date = gets.chomp
    rental = Rental.new(date, @people[person], @books[chosen_book])
    puts "Thank you #{@people[person]} for renting a book"
    @rentals.push(rental)
  end

end
