class Kid < ActiveRecord::Base
    has_many :chores
    has_many :tasks, through: :chores
end