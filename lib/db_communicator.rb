def create_chore
    puts "Great! Let's create a new Chore!"
    task = which_task?
    if task.class != Task
        return
    end
    kid = which_kid?
    if kid.class != kid
        return
    end
    chore = Chore.create(kid_id: kid.id, task_id: task.id, completed: complete)
    puts "Your chore has been added!"
    puts "#{chore.kid.name} has been assigned #{chore.task.title}."
end

def complete_chore
    puts "Please Choose a Chore to Complete"
    chore = which_chore?
    chore.update(completed: true)
    puts "#{chore.task.title} \u2023 #{chore.kid.name} has been completed."
end

def print_incomplete
    incomplete = incomplete_chores
    empty_list(incomplete)
    puts ""
    puts "INCOMPLETE CHORES: "

    incomplete.each do |chore|
        puts ""
        puts "\u02DF #{chore.task.title} \u2023 #{chore.kid.name}"
    end
end



def print_complete
    complete = complete_chores
    empty_list(complete)
    puts ""
    puts "COMPLETE CHORES: "

    complete.each do |chore|
        puts ""
        puts "\u02DF #{chore.task.title} \u2023 #{chore.kid.name}"
    end
end



def print_all_chores
    Chore.all.each_with_index do |chore, i|
        puts "#{chore.completed ? "\u2713" : "\u02DF"} #{i+1}. #{chore.task.title} by #{chore.kid.name}"
        puts "      Completed: #{chore.completed ? "true" : "false"}"
    end
end


def print_chores_by_child(child)
    chores = child.chores
    empty_list(chores)
    chores.each_with_index do |chore, i|
        puts "#{i+1}. #{chore.task.title} by #{chore.kid.name}"
        puts "      Completed: #{chore.completed ? "true" : "false"}"
        puts "      Reward: $#{chore.task.reward}.00"
        puts ""
    end
end

def calculate_reward(kid)
    puts "$#{kid.total_reward}.00"
end

def add_task
    puts "Please enter the name of the task"
    title = $stdin.gets.chomp
    puts "Please enter a reward amount (1-5)"
    reward = $stdin.gets.chomp.to_i
    puts "Please enter difficulty"
    difficulty = $stdin.gets.chomp.to_i
    Task.create(title: title, difficulty: difficulty, reward: reward)
    puts ""
    puts "New Task: #{task.title}, Difficulty: #{task.difficulty}, Reward: $#{task.reward}"
end

def remove_task
    task = which_task?
    task_chores = Chore.all.select {|chore| chore.task_id == task.id}
    task_chores.each {|chore| chore.destroy}
    task_name = task.title
    puts "#{task_name} has been deleted!"
end

def delete_chore
    chore = which_chore?
    chore.destroy
end

def delete_all_chores
    Chore.destroy_all
end


def incomplete_chores
    Chore.all.select {|chore| chore.completed == false }
end

def complete_chores
    Chore.all.select {|chore| chore.completed == true }
end

def complete?
    puts " "
    while true do
        puts "Is the task Completed?"
        puts "Enter YES or NO"
        input = $stdin.gets.chomp.downcase
        if input == "yes" || input == "y"
            return true
            break
        elsif input == "no" || input == "n"
            return false
            break
        else
            puts "!!!"
            puts "Sorry. Not a valid input."
        end
    end
end

def which_chore? #returns a chore object
    puts "Please Select a Chore!"
    while true do 
        puts ""
        puts "Here are your Chores"
        chores = Chore.all
        empty_list(chores)
        chores.each_with_index do |chore, index|
            puts "  "
            puts "#{index + 1}: #{chore.task.title} by #{chore.kid.name} "
        end
        puts " "
        puts "Please enter the Number for the Chore: "
        menu_exit_options
        puts " "
        input = $stdin.gets.chomp
        if input.downcase == "menu"
            puts_options
            break
        elsif input.downcase == "exit"
            break
        end
        choice = input.to_i
        if (choice >= 1) && (choice <= Chore.all.length)
            index = choice - 1
            chore = Chore.all[index]
            return chore
            break
        else 
            puts "!!!!"
            puts "Sorry! Please enter a valid number for your Chore!!"
        end
    end
end

def which_kid? #returns a kid object
    while true do 
        puts "Here are your Children"
        Kid.all.each_with_index do |kid, index|
            puts "  "
            puts "#{index + 1}: #{kid.name}"
        end
        puts " "
        puts "Please enter the Number for the Child: "
        menu_exit_options
        puts " "
        input = $stdin.gets.chomp
        if input.downcase == "menu"
            puts_options
            break
        elsif input.downcase == "exit"
            break
        end
        choice = input.to_i
        if (choice >= 1) && (choice <= Kid.all.length)
            index = choice - 1
            kid = Kid.all[index]
            return kid
            break
        else 
            puts "!!!!"
            puts "Sorry, please enter a valid number."
        end
    end
end

def which_task?
    while true do 
        puts "Here are your Available Tasks"
        Task.all.each_with_index do |task, index|
            puts "  "
            puts "#{index + 1}: #{task.title}"
        end
        puts " "
        puts "Please Enter the Number of the Task You Would Like: "
        menu_exit_options
        puts " "
        input = $stdin.gets.chomp
        if input.downcase == "menu"
            puts_options
            break
        elsif input.downcase == "exit"
            break
        end
        choice = input.to_i
        if (choice >= 1) && (choice <= Task.all.length)
            index = choice - 1
            task = Task.all[index]
            return task
            break
        else 
            puts "!!!!"
            puts "Sorry, please enter a valid number for your Task."
        end
    end
end

def empty_list(list)
    if list.length < 1
        puts ""
        puts "This list is currently empty!"
    end
end
