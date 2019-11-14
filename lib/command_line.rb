# OPTIONS = ["See Chores", "Calculate Reward", "Edit"]
# view_chores = ["All Chores", "Completed Chores", "Incomplete Chores"]
# edit = ["Create New", "Delete", "Update"]
# add_options = [""]



#greets and gets the answer and 
def greeting
    new_break
    puts "Hello! Welcome back to your Chore Org\u00A9 !"
    puts "What would you like to do today?"
    new_break
end

def options  #RETURNS INPUT
    while true do
        puts "    ***************************************************************************"
        puts " "
        puts "      **** Please Type a Choice OR a Number and press ENTER ****        "
        puts " "
        puts "[1]        CREATE NEW CHORE          Assign a task."
        puts " "
        puts "[2]        COMPLETE CHORE            Mark a Chore as Complete."
        puts " "
        puts "[3]        VIEW CHORES                View Menu Options for Chores."
        puts ""
        puts "[4]        CALCULATE REWARD         Calculate the reward for a child."
        puts "                  "
        puts "[5]        ADD A TASK               Add a new task that can be assigned."
        puts "                  "
        puts "[6]        DELETE A TASK            Remove a task from your task list. This will remove all associated chores."
        puts "                  "
        puts "[7]       DELETE A CHORE           No longer need the chore? Remove a chore from the assigned list." 
        puts " "
        puts "[8]      DELETE ALL CHORES         Clear all current chores "
        puts " "
        puts_exit_option
        puts "Please Enter Input Here:"
        input = $stdin.gets.chomp.downcase
        int = input.to_i
        puts ""
        new_break
        if input == "exit"
            goodbye_message
            break
        elsif input == "create new chore" || int == 1
            create_chore
            another_request?
            break
        elsif input == "complete chore" || int == 2
            complete_chore
            another_request?
            break
        elsif input == "view chores" || int == 3
           chores_menu
           another_request?
           break
        elsif input == "calculate reward" || int == 4
            kid = which_kid?
            calculate_reward(kid)
            another_request?
            break
        elsif input == "add a task" || int == 5
            add_task
            another_request?
            break
        elsif input == "delete a task"|| int == 6
            remove_task
            another_request?
            break
        elsif input == "delete a chore" || int == 7
            delete_chore
            another_request?
            break
        elsif input == "delete all chores" || int == 8
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

def chores_menu
    while true do 
        puts "******   CHORES MENU   ******"
        new_line(1)
        puts "Which Chores Would You Like To View?"
        new_line(2)
        puts "[1]    *    INCOMPLETE CHORES    *     View list of chores that are incomplete."
        puts "  "
        puts "[2]    *    COMPLETED CHORES     *     View list of chores that are incomplete."
        puts " "
        puts "[3]    *       ALL CHORES        *     View list of all chores."
        puts " "
        puts "[4]    *    CHORES PER CHILD     *     View each child's list of chores."
        puts " "
        puts "[5]    *  CHORES FOR ONE CHILD   *     View list of all chores for a specific child." 
        puts " "
        puts_exit_option
        puts "Please Enter Input Here:"
        input = $stdin.gets.chomp.downcase
        int = input.to_i
        puts ""
        new_break
        if input == "exit"
            goodbye_message
            break
        elsif input == "incomplete chores" || int == 1
            print_incomplete
            break
        elsif input == "completed chores" || int == 2
            print_complete
            break
        elsif input == "all chores" || int == 3
            print_all_chores
            break
        elsif input == "chores per child" || int == 4
            print_chores_per_child 
            break
        elsif input == "chores for one child" || int == 5
            kid = which_kid?
            print_chores_by_child(kid)
            break
        elsif input == "menu"
            options
            break
        else 
            puts "Sorry, please enter valid choice (command or number) and press ENTER" 
        end
    end
end

def new_line(x)
    x.times do
        puts ""
    end
end

def new_break
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
    new_break
end

