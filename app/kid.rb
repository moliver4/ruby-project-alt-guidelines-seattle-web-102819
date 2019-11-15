class Kid < ActiveRecord::Base
    has_many :chores
    has_many :tasks, through: :chores


    

    def tasks
        self.chores.map {|chore| chore.task}
    end

    def task_names
        tasks.map {|task| task.title}
    end

    def completed_chores
        self.chores.select {|chore| chore.completed = true}
    end

    def completed_tasks
        completed_chores.map {|chore| chore.task}
    end

    def total_reward
        completed_tasks.map{|task| task.reward}.sum
    end
        
end