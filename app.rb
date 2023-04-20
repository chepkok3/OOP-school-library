require_relative 'decorator'
require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'book'
require_relative 'rental'
require_relative 'classroom'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
    @classrooms = []
  end

  def list_of_books
    if @books.empty?
      puts 'No books in the list'
    else
      @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
    end
  end

  def person_display(person)
    print "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    puts ", Specialization: #{person.specialization}" if person.instance_of?(Teacher)
    puts ", Classroom: #{person.classroom}" if person.instance_of?(Student)
  end

  def list_of_people
    if @people.empty?
      puts 'No people found in the library'
    else
      @people.each { |person| person_display(person) }
    end
  end

  def add_person_info
    puts 'Select a person type by number'
    puts '1 - Student'
    puts '2 - Teacher'
    person_type = gets.chomp

    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    create_person(person_type, age, name)
  end

  def create_person(person_type, age, name)
    case person_type
    when '1'
      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp.downcase == 'y'
      print 'Student\'s classroom: '
      classroom = gets.chomp
      @people.push(Student.new(age, name, classroom, parent_permission:))
    when '2'
      print 'Specialization: '
      specialization = gets.chomp
      @people.push(Teacher.new(age, name, specialization))
    else
      puts 'Invalid option'
      add_person_info
    end

    puts 'Created successfully'
  end

  def book_creation
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books.push(Book.new(title, author))
    puts 'Book created successfully'
  end

  def rental_creation
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) #{book.title}, #{book.author}" }

    index_book = gets.chomp.to_i

    puts 'Select a person from following list by number (not ID)'
    @people.each_with_index do |person, index|
      print "#{index}) "
      person_display(person)
    end

    index_person = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    @rentals.push(Rental.new(date, @books[index_book], @people[index_person]))
    puts 'Rental created successfully'
  end

  def list_of_rentals_person_id
    print 'person ID: '
    id = gets.chomp.to_i

    puts 'Rentals: '
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end
  end
end
