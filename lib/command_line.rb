# OPTIONS = ["See Chores", "Calculate Reward", "Edit"]
# view_chores = ["All Chores", "Completed Chores", "Incomplete Chores"]
# edit = ["Create New", "Delete", "Update"]
# add_options = [""]



#greets and gets the answer and 
def greeting
    new_break
    puts "          Hello! Welcome back to your Chore Org\u00A9 !"
    puts "             What would you like to do today?"
    new_break
end

def options  #RETURNS INPUT
    while true do
        puts "    ************************************************************************"
        puts " "
        puts "      **** Please Type a Choice OR a Number and press ENTER ****        "
        puts " "
        puts "[1]    *   CREATE NEW CHORE   *        Assign a task."
        puts " "
        puts "[2]    *    COMPLETE CHORE    *        Mark a chore as complete."
        puts " "
        puts "[3]    *     VIEW CHORES      *        View menu options for chores."
        puts ""
        puts "[4]    *   CALCULATE REWARD   *        Calculate the reward for a child based on completed chores."
        puts "  "
        puts "[5]    *    DELETE A CHORE    *        No longer need the chore? Remove a chore from the assigned list." 
        puts " "
        puts "[6]    *  DELETE ALL CHORES   *        Clear all current chores. We recommend clearing your chore list 1x per week/month."
        puts " "
        puts "[7]    *      EDIT TASKS      *        View and edit your Task List"
        puts " "
        puts "[8]    *      EDIT KIDS      *        View and edit your Children List"
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
            calculate_reward
            another_request?
            break
        elsif input == "delete a chore" || int == 5
            delete_chore
            another_request?
            break
        elsif input == "delete all chores" || int == 6
            delete_all_chores
            another_request?
            break
        elsif input == "edit tasks" || input == "tasks" || int == 7 || input == "edit task"
            task_menu
            another_request?
            break
        elsif input == "edit kids" || input == "kids" || int == 8 || input == "edit kid"
            kid_menu
            another_request?
            break
        else 
            puts "Sorry, please enter valid choice and press ENTER"
        end
    end
end


#HELPER METHODS
def kid_menu
    while true do 
        puts "         ******   KID MENU   ******"
        new_line(1)
        puts "  Would you like to VIEW or ADD or DELETE?"
        new_line(2)
        puts "[1]    *       VIEW     *     View list of your kids."
        puts "  "
        puts "[2]    *       ADD      *     Add a new child account."
        puts " "
        puts "[3]    *      DELETE    *     View list and remove a child account."
        puts " "
        go_back_option
        new_line
        puts "  Please Enter Your Choice:"
        input = $stdin.gets.chomp.downcase
        int = input.to_i
        puts ""
        new_break
        if input == "back" || input == "no" || input == "exit"
            break
        elsif input == "view" || int == 1 || input == "view kids"
            print_kids
            break
        elsif input == "add" || int == 2 || input == "add kid"
            add_kid
            break
        elsif input == "delete" || int == 3 || input == "delete kid"
            delete_kid
            break
        else 
            puts "  Sorry, please enter valid choice (command or number) and press ENTER" 
        end
    end
end

def task_menu
    while true do 
        puts "      ******   TASK MENU   ******"
        new_line(1)
        puts "  Would you like to VIEW or ADD or DELETE a Task?"
        new_line(2)
        puts "[1]    *      VIEW      *     View list of available tasks to choose from."
        puts "  "
        puts "[2]    *       ADD      *     Add a new task to Task List."
        puts " "
        puts "[3]    *      DELETE    *     View list and delete a task."
        puts " "
        go_back_option
        new_line
        puts "  Please Enter Your Choice:"
        input = $stdin.gets.chomp.downcase
        int = input.to_i
        puts ""
        new_break
        if input == "back" || input == "no" || input == "exit"
            break
        elsif input == "view" || int == 1
            print_tasks
            break
        elsif input == "add" || int == 2
            add_task
            break
        elsif input == "delete" || int == 3
            remove_task
            break
        else 
            puts "  Sorry, please enter valid choice (command or number) and press ENTER" 
        end
    end
end

def chores_menu
    while true do 
        puts "      ******   CHORES MENU   ******"
        new_line(1)
        puts "  Which Chores Would You Like To View?"
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
        go_back_option
        new_line
        puts "  Please Enter Your Choice:"
        input = $stdin.gets.chomp.downcase
        int = input.to_i
        puts ""
        new_break
        if input == "back" || input == "no" || input == "exit"
            break
        elsif input == "incomplete chores" || int == 1
            print_incomplete
            break
        elsif input == "completed chores" || int == 2
            print_complete
            break
        elsif input == "all chores" || int == 3
            print_all_chores(Chore.all)
            break
        elsif input == "chores per child" || int == 4
            print_chores_per_child 
            break
        elsif input == "chores for one child" || int == 5
            kid = which_kid?
            print_chores_by_child(kid)
            break
        else 
            puts "  Sorry, please enter valid choice (command or number) and press ENTER" 
        end
    end
end

def new_line(x =1)
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
    while true do 
        puts "  Would you like to do something else?"
        if yesno
            options
            break
        else
            goodbye_message
            break
        end
    end
end

def menu_exit_options
    puts_menu_option
    puts_exit_option
end

def puts_menu_option 
    puts " "
    puts "  Enter MENU for Main Menu"
end

def puts_exit_option
    puts " "
    puts "  Enter EXIT to Exit Program"
    puts ""
end

def goodbye_message
    new_break
    puts "          Thank you for using Chore Org\u00A9 !"
    puts "                  Have a Great Day!"
    puts "                  BYEEEEEEEEEEEEEEE"
    new_break
end

