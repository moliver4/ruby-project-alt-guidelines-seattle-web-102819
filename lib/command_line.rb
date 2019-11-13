# OPTIONS = ["See Chores", "Calculate Reward", "Edit"]
# view_chores = ["All Chores", "Completed Chores", "Incomplete Chores"]
# edit = ["Create New", "Delete", "Update"]
# add_options = [""]



#greets and gets the answer and 
def greeting
    puts "Hello! Welcome back to your Chore Org\u00A9 !"
    puts "What would you like to do today?"
end

def options  #RETURNS INPUT
    while true do
        puts "*******************************************************************************"
        puts "Please type a choice and press ENTER"
        puts "                  "
        puts "        CREATE NEW CHORE          Assign a task."
        puts "                  "
        puts "        COMPLETE CHORE            Mark a Chore as Complete."
        puts "                  "
        puts "        INCOMPLETE CHORES         View list of chores that are incomplete."
        puts "                  "
        puts "        COMPLETED CHORES          View list of chores that are incomplete."
        puts "                  "
        puts "        ALL CHORES                View list of all chores."
        puts "                  "
        puts "        CHORES BY CHILD           View list of all chores assigned to one child."
        puts "                  "
        puts "        CALCULATE REWARD         Calculate the reward for a child."
        puts "                  "
        puts "        ADD A TASK               Add a new task that can be assigned."
        puts "                  "
        puts "        DELETE A TASK            Remove a task from your task list. This will remove all associated chores."
        puts "                  "
        puts "        DELETE A CHORE           No longer need the chore? Remove a" 
        puts "                                     chore from the assigned list."
        puts " "
        puts "        DELETE ALL CHORES         clear all current chores "
        puts " "
        puts_exit_option
        puts "Please Enter Input Here:"
        input = $stdin.gets.chomp.downcase
        puts ""
        new_line
        if input == "exit"
            goodbye_message
            break
        elsif input == "create new chore"
            create_chore
            another_request?
            break
        elsif input == "complete chore"
            complete_chore
            another_request?
            break
        elsif input == "incomplete chores"
            print_incomplete
            another_request?
            break
        elsif input == "completed chores"
            print_complete
            another_request?
            break
        elsif input == "all chores"
            print_all_chores
            another_request?
            break
        elsif input == "chores by child"
            kid = which_kid?
            print_chores_by_child(kid)
            another_request?
            break
        elsif input == "calculate reward"
            kid = which_kid?
            calculate_reward(kid)
            another_request?
            break
        elsif input == "add a task"
            add_task
            another_request?
            break
        elsif input == "delete a task"
            remove_task
            another_request?
            break
        elsif input == "delete a chore"
            delete_chore
            another_request?
            break
        elsif input == "delete all chores"
            delete_all_chores
            another_request?
            break
        elsif input == "menu"
            puts_options
            break
        else 
            puts "Sorry, please enter valid choice and press ENTER"
        end
    end
end


#HELPER METHODS

def new_line
    puts ""
    puts "***********************************************************"
    puts ""
end
def another_request?
    puts ""
    puts ""
    puts "Would you like to do something else?"
    puts "Please Enter YES or NO"
    while true do 
        input = $stdin.gets.chomp.downcase
        if input == "yes"
            options
            break
        elsif input == "no"
            goodbye_message
            break
        else 
            puts "!!!!"
            puts "Sorry, would you like to go to the main menu?"
            puts "Please Enter Yes or No"
        end
    end
end

def menu_exit_options
    puts_menu_option
    puts_exit_option
end

def puts_menu_option 
    puts " "
    puts "Enter MENU for Main Menu"
end

def puts_exit_option
    puts " "
    puts "Enter EXIT to Exit Program"
    puts ""
end

def goodbye_message
    puts "Thank you for using Chore Org\u00A9 !"
    puts "Have a Great Day!"
end