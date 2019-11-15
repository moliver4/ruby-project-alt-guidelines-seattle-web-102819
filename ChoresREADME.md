Chores Organizer Mod 1 Final Project 
==============================================

Thank You for your interest in my Chores Organizer Project!

This is a command line application that allows the User/Parent to manage and keep track of chores for their children.
Chores are assigned Tasks that can be designated to a Child for a reward. 
The User/Parent can do any of the following:
- View all chores
    All, Incomplete, or Complete
    By Child or Per Child
- Create a new chore by assigning a task to a child.
    -A Chore will not be created if it already exists for that child.
    -A Chore will not be created if a child's skill level is LESS than the task's difficulty.
- Update a chore to complete once it is done.
- Calculate the amount of money/reward the child has earned via completed chores.
- Add/Delete Children (Name, Age, Skill level)
    -Deleting a child will delete all associated chores.
- Add/Delete Tasks (Title, Difficulty, Reward)
    -Deleting a task will delete all associated chores.

============================================

DEPLOYMENT

After downloading the program onto your computer, please do the following: 
+ Run 'bundle install' in the directory to install necessary gems.
+ Run "rake db:migrate"
+ Run 'rake db:seed' to seed test data
+ Run 'ruby bin/run.rb'

=============================================
ACKNOWLEDGEMENTS
This CLI app utilized additional gems:
+  https://github.com/splendeo/activerecord-reset-pk-sequence 
+  https://github.com/ruby2d/ruby2d -Thanks Michael for help with implementation of the .wav sound file!
+  https://github.com/faker-ruby/faker




