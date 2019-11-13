# OPTIONS = ["See Chores", "Calculate Reward", "Edit"]
# view_chores = ["All Chores", "Completed Chores", "Incomplete Chores"]
# edit = ["Create New", "Delete", "Update"]
# add_options = [""]



#greets and gets the answer and 
def greeting
    puts "Hello! Welcome back to your Chore Org\u00A9 !"
    puts "What would you like to do today?"
end

def puts_options  #RETURNS INPUT
    puts "*******************************************************************************"
    puts "Please type a choice and press ENTER"
    puts "                  "
    puts "        CREATE NEW CHORE         Assign a task."
    puts "                  "
    puts "        COMPLETE A CHORE         Mark a Chore as Complete."
    puts "                  "
    puts "        INCOMPLETE CHORES        View list of chores that are incomplete."
    puts "                  "
    puts "        COMPLETED CHORES         View list of chores that are incomplete."
    puts "                  "
    puts "        ALL CHORES               View list of all chores."
    puts "                  "
    puts "        CALCULATE REWARD         Calculate the reward for a child."
    puts "                  "
    puts "        ADD A TASK               Add a new task that can be assigned."
    puts "                  "
    puts "        DELETE A TASK            Remove a task from your task list."
    puts "                  "
    puts "        DELETE A CHORE           No longer need the chore? Remove a" 
    puts "                                     chore from the assigned list."
    puts " "
    puts "        DELETE ALL CHORES         clear all current chores "
    puts " "
    puts_exit_option
    puts "Please Enter Input Here"
    input = $stdin.gets.chomp.downcase
end

def next_move(input)
    if input == "0" || input == "exit"
        goodbye_message
    elsif input == "create new chore"
        
    elsif input == "complete a chore"
    elsif input == "incomplete chores"
    elsif input == "completed chores"
    elsif input == "all chores"
    elsif input == "calculate reward"
    elsif input == "add a task"
    elsif input == "delete a task"
    elsif input == "delete a chore"
    elsif input == "delete all chores"
    else 
        puts "Sorry, please enter valid choice and press ENTER"
    end
end




def menu
    puts 'Enter "menu" for options'
    puts_options
end



# def view_kid?
#     puts "To see who is assigned to these chores, Enter YES"
#     answer = gets.chomp
# end

# def create_new_chore(task, kid)
#     if kid.skill_level < task.difficulty
#         puts "Sorry, #{kid.name} cannot do this task"
#     else
#         Chore.create(kid_id: kid.id, task_id: task.id, completed: false)
# end

# def complete_chore(task, kid)
#     chore = Chore.find_chore(task, kid)
#     chore.complete = true
#     chore.save
# end


#HELPER METHODS
def puts_exit_option
    puts " "
    puts "  ENTER 0 TO EXIT or TYPE 'EXIT' "
    puts ""
end

def goodbye_message
    puts "Thank you for using Chore Org\u00A9 !"
    puts "Have a Great Day!"
end