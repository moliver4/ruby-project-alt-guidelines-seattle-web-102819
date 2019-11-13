options = ["Create a New Chore", "Update a Chore", "View Current Chores", "Find My Child's Total Rewards", "Add/Delete a Task", "Add a Child"]
#greets and gets the answer and 
def greeting
    puts "Hello! Welcome back to your Chore Organizer!"
    puts "What would you like to do today?"
    puts_options
    choice = gets.chomp
end

def menu
    puts 'Enter "menu" for options'
end

def puts_options
    options.each_with_index do |option, i|
        puts "#{i+1}. #{option}"
    end 
end

def next_move(choice)
end


