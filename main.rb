require_relative 'app'
def display_menu
  puts 'Welcome to the Library App!'
  puts 'Select an option:'
  puts '1 - Create a person'
  puts '2 - Create a book'
  puts '3 - Create a rental'
  puts '4 - List people'
  puts '5 - List books'
  puts '6 - List rentals for a person by ID'
  puts '7 - Quit'
  print 'Enter your choice: '
end

def handle_menu_option(choice, app)
  case choice
  when 1
    app.create_person
  when 2
    app.create_book
  when 3
    app.create_rental
  when 4
    app.list_people
  when 5
    app.list_books
  when 6
    app.list_rentals_for_person_id
  end
end

def main
  app = App.new
  loop do
    display_menu
    option = gets.chomp.to_i
    handle_menu_option(option, app)
    break if option == 7
  end
  puts 'Thank you for using the Library App. Goodbye!'
end
main

