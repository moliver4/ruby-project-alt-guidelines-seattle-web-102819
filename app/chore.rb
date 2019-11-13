class Chore < ActiveRecord::Base
    belongs_to :kids
    belongs_to :tasks

    #returns a kid matching this chore
    def kid
        Kid.all.find {|kid| kid.id == self.kid_id}
    end
    #returns a task matching this chore
    def task
        Task.all.find {|task| task.id == self.task_id}
    end

end