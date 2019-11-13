class Kid < ActiveRecord::Base
    has_many :chores
    has_many :tasks, through: :chores


    def chores
        Chore.all.select {|chore| chore.kid == self}
    end

    def tasks
        chores.map {|chore| chore.task}
    end

    def task_names
        tasks.map {|task| task.title}
    end

    def total_reward
        tasks.map {|task| task.reward}.sum
    end
        
end