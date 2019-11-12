options = ["Create a New Chore", "Update a Chore", "Find My Child's Total Rewards", "Add/Delete a Task", "Add a Child"]
def greeting
    puts "Hello! Welcome back"
    puts "What would you like to do today?"
    puts_options
end

def puts_options
    options.each_with_index do |option, i|
        puts "#{i+1}. #{option}"
    end 
end
