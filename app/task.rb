class Task < ActiveRecord::Base
    has_many :chores
    has_many :kids, through: :chores


    ######### 
    #returns all the kids for this task
    def kids
        chores.map {|chore| chore.kid}
    end

    #returns all chores about this task
    def chores
        Chore.all.select {|chore| chore.task == self}
    end
end