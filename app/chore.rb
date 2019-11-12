class Chore < ActiveRecord::Base
    belongs_to :kids
    belongs_to :tasks
end