def create_chore
    puts "Great! Let's create a new Chore!"
    puts " "
    task = which_task?
    if task
        puts " "
        kid = which_kid?
        if kid 
            puts " "
            if (task.difficulty) > (kid.skill_level)
                puts ""
                puts "Sorry, your kid is not skilled enough to do that!"
                puts ""
                return
            end
            complete = complete?
            search = Chore.find_by(kid_id: kid.id, task_id: task.id, completed: complete)
            if search
                puts ""
                puts "You already have this chore!"
                puts ""
                puts " #{search.completed ? "\u2713" : "\u02DF"}   #{search.task.title}   \u2023   #{search.kid.name}"
                return
            end
            chore = Chore.create(kid_id: kid.id, task_id: task.id, completed: complete)
            puts " "
            puts "              Awesome! "
            puts "         Your chore has been added!"
            puts "  #{chore.kid.name} has been assigned #{chore.task.title}."
    
        end
    end
end

def complete_chore
    puts "Please Choose a Chore to Complete"
    new_line
    chore = which_chore?
    if chore
        if chore.completed == true
            new_line
            puts "This chore is already completed!"
            return
        end
        chore.update(completed: true)
        new_line
        puts "                 YAY!"
        puts "\u02DF  #{chore.task.title}   \u2023   #{chore.kid.name} has been completed."
        puts "    $#{chore.task.reward}.00 has been earned"
    end
end

def print_incomplete
    incomplete = incomplete_chores
    print_all_chores(incomplete)
end



def print_complete
    complete = complete_chores
    print_all_chores(complete)
end


def confirm_delete #returns boolean
    new_line(2)
    puts "  Are you sure you want to delete this? "
    puts "  Once gone, the data will not be able to be recovered."
    new_line(1)
    yesno
end

def yesno #returns boolean
    while true do
        puts ""
        puts "Please Enter Yes or No"
        puts ""
        
        input = $stdin.gets.chomp.downcase
        if input == "yes"
            return true
            break
        elsif input == "no"
            return false
            break
        end
    end
end

def print_all_chores(array)
    if array.length < 1
        puts "Wow! Looks like you have no chores right now."
        return
    end
    new_line(2)
    puts "     *****    CURRENT CHORES      *****"
    array.each_with_index do |chore, i|
        puts "#{chore.completed ? "\u2713" : "\u02DF"} #{i+1}. #{chore.task.title}     \u2023     #{chore.kid.name}"
        puts "     #{chore.completed ? "Complete" : "Incomplete"}"
        puts "     Reward: $#{chore.task.reward}.00"
        puts ""
    end
end


def print_chores_by_child(child)
    chores = child.chores
    empty_list(chores)
    chores.each_with_index do |chore, i|
        puts "#{chore.completed ? "\u2713" : "\u02DF"} #{i+1}. #{chore.task.title}"
        puts "     #{chore.completed ? "Complete" : "Incomplete"}"
        puts "     Reward: $#{chore.task.reward}.00"
        puts ""
    end
end

def calculate_reward
    kid = which_kid?
    if kid
        new_line
        sound = Music.new("cramer-03.wav")
        sound.play
        puts "      #{kid.name} earned a total of $#{kid.total_reward}.00!"
        new_line 
    end
end

def add_task
    new_line
    go_back_option
    new_line
    puts "  Please enter the name of the task"
    input = $stdin.gets.chomp.downcase
    if input == "back" || input == "no" || input == "exit"
        return
    end
    title = input.capitalize
    condition = true
    while condition do
        puts "  Please enter #{title}'s reward amount. (0-5)"
        input = $stdin.gets.chomp.downcase
        if input == "back" || input == "no" || input == "exit"
            return
        end
        reward = input.to_i
        if reward >= 0 && reward < 6
            condition = false
        end
    end
    condition = true
    while condition do
        puts "  Please enter #{title}'s difficulty level. (1-3)"
        input = $stdin.gets.chomp.downcase
        if input == "back" || input == "no" || input == "exit"
            return
        end
        difficulty = input.to_i
        if difficulty > 0 && difficulty < 4
            condition = false
        end
    end
    test = Task.find_by(title: title, difficulty: difficulty, reward: reward)
    if test 
        puts ""
        puts "You already have this chore!"
        puts ""
        puts "  Task: #{test.title}, Difficulty: #{test.difficulty}, Reward: $#{test.reward}.00"
        return
    end
    new = Task.create(title: title, difficulty: difficulty, reward: reward)
    new_line
    puts "              Success!"
    new_line
    puts "  New Task: #{new.title}, Difficulty: #{new.difficulty}, Reward: $#{new.reward}.00"
end

def remove_task
    new_line
    puts "  Please Select a Task to Delete"
    task = which_task?
    if task
        task_name = task.title
        puts "  You have chosen to Delete #{task_name}."
        puts "  All associated chores will be deleted as well."
        if confirm_delete
            task_chores = Chore.all.select {|chore| chore.task_id == task.id}
            task_chores.each {|chore| chore.destroy}
            task.destroy
            new_line
            puts "  Cool! #{task_name} has been deleted!"
        else 
            new_line
            puts "  Whew! #{task_name} was not deleted."
        end
    end
end

def delete_chore
    new_line
    puts "  Which Chore Would You Like To Delete?"
    chore = which_chore?
    if chore
        if confirm_delete
            chore.destroy
            new_line
            puts "  #{chore.task.title} by #{chore.kid.name} has been deleted."
        else 
            puts "  Chore not deleted."
        end
    end
end

def delete_all_chores
    puts ""
    puts "You have chosen to delete ALL chores."
    if confirm_delete
        Chore.destroy_all
        puts "  All Chores Have Been Deleted."
    else
        puts "  Chores not deleted."
    end
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
    puts "          Please Select a Chore!"
    while true do 
        print_all_chores(Chore.all)
        puts " "
        puts "Please enter the Number for the Chore: "
        go_back_option
        puts " "
        input = $stdin.gets.chomp
        put = input.downcase
        if put == "back" || put == "no" || put == "exit"
            break
        end
        choice = input.to_i
        if (choice >= 1) && (choice <= Chore.all.length)
            index = choice - 1
            chore = Chore.all[index]
            return chore
            break
        else 
            new_line(2)
            puts "!!!!"
            puts "Sorry! Please enter a valid number for your Chore!!"
        end
    end
end


def print_kids
    new_line(2)
    puts " *****        CHILDREN        *****"
    new_line
    Kid.all.each_with_index do |kid, index|
        puts "  "
        puts "[#{index + 1}]   #{kid.name}   Age: #{kid.age}    Skill Level: #{kid.skill_level}"
    end
end

def which_kid? #returns a kid object
    while true do 
        puts "Here are your Children:"
        print_kids
        puts " "
        puts "Please enter the Number for the Child: "
        go_back_option
        puts " "
        input = $stdin.gets.chomp
        put =input.downcase
        if put == "back" || put == "no" || put == "exit"
            break
        end
        choice = input.to_i
        if (choice >= 1) && (choice <= Kid.all.length)
            index = choice - 1
            kid = Kid.all[index]
            return kid
            break
        else 
            new_line(2)
            puts "!!!!"
            puts "Sorry, please enter a valid number."
        end
    end
end

def go_back_option
    new_line
    puts "  Enter NO or BACK or EXIT if you changed your mind."
end


def print_tasks
    new_line(2)
    puts "  *****    Available Tasks     *****"
    Task.all.each_with_index do |task, index|
        puts "  "
        puts "#{index + 1}: #{task.title}    Difficulty: #{task.difficulty}     Reward: $#{task.reward}.00"
    end
end

def which_task?
    while true do 
        print_tasks
        puts " "
        puts "Please Enter the Number of the Task You Would Like: "
        go_back_option
        puts " "
        input = $stdin.gets.chomp
        put = input.downcase
        if put == "back" || put == "no" || put == "exit"
            break
        end
        choice = input.to_i
        if (choice >= 1) && (choice <= Task.all.length)
            index = choice - 1
            task = Task.all[index]
            return task
            break
        else 
            new_line(2)
            puts "!!!!"
            puts "Sorry, please enter a valid number for your Task."
        end
    end
end

def empty_list(list)
    if list.length < 1
        puts ""
        puts "This list is currently empty! "
        puts "    Whoot! No Chores!"
        puts "  "
    end
end

def print_chores_per_child
    new_line(2)
    puts " *****        CHORES BY CHILD        *****"
    Kid.all.each do |kid|
        new_line(2)
        puts "          **********"
        new_line(2)
        puts "        #{kid.name.upcase}"
        new_line
        print_chores_by_child(kid)
    end
end

def add_kid
    new_line
    go_back_option
    new_line
    puts "  Please enter the first name of your new child"
    input = $stdin.gets.chomp.downcase
    if input == "back" || input == "no" || input == "exit"
        return
    end
    name = input.capitalize
    puts "  Please enter #{name}'s age.'"
    input = $stdin.gets.chomp.downcase
    if input == "back" || input == "no" || input == "exit"
        return
    end
    age = input.to_i
    condition = true
    skill_level = 0
    while condition do
        puts "  Please enter #{name}'s skill level. (1-3)"
        input = $stdin.gets.chomp.downcase
        if input == "back" || input == "no" || input == "exit"
            return
        end
        skill_level = input.to_i
        if skill_level > 0 && skill_level < 4
            condition = false
        end
    end
    test_kid = Kid.find_by(name: name, age: age, skill_level: skill_level)
    if test_kid 
        puts ""
        puts "#{name} already exists!!"
        puts ""
        puts "  Child: #{test_kid.name}, Age: #{test_kid.age}, Skill Level: #{test_kid.skill_level}"
        return
    end
    new_kid = Kid.create(name: name, age: age, skill_level: skill_level)
    new_line
    puts "              Success!"
    new_line
    puts "  Child: #{new_kid.name}, Age: #{new_kid.age}, Skill Level: #{new_kid.skill_level} has been created!"
end

def delete_kid
    new_line
    puts "  Please Select a Child Account to Delete"
    kid1 = which_kid?
    if kid1
        kid_name = kid1.name
        puts "  You have chosen to Delete #{kid_name}."
        puts "  All associated chores will be deleted as well."
        if confirm_delete
            kid_chores = kid1.chores
            kid_chores.each {|chore| chore.destroy}
            kid1.destroy
            new_line
            puts "  Cool! #{kid_name} has been deleted!"
        else 
            new_line
            puts "  Whew! #{kid_name} was not deleted."
        end
    end
end
