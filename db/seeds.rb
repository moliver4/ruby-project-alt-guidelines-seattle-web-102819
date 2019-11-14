Chore.destroy_all
Task.destroy_all
Kid.destroy_all
Chore.reset_pk_sequence
Task.reset_pk_sequence
Kid.reset_pk_sequence

Kid.create(name: "Becky", age: 19, skill_level: 3)
Kid.create(name: "Brian", age: 15, skill_level: 3)
Kid.create(name: "Jessica", age: 7, skill_level: 2)
Kid.create(name: "Jason", age: 6, skill_level: 1)

Task.create(title: "Rake Leaves", difficulty: 2, reward: 2)
Task.create(title: "Make Bed", difficulty: 1, reward: 1)
Task.create(title: "Wash Dishes", difficulty: 3, reward: 3)
Task.create(title: "Vaccuum", difficulty: 3, reward: 3)
Task.create(title: "Sweep", difficulty: 3, reward: 2)
Task.create(title: "Take Out Trash", difficulty: 2, reward: 1)
Task.create(title: "Clean Up Room", difficulty: 2, reward: 5)
Task.create(title: "Start Laundry", difficulty: 3, reward: 3)
Task.create(title: "Fold Laundry", difficulty: 3, reward: 5)
Task.create(title: "Pick Up Toys", difficulty: 1, reward: 1)
Task.create(title: "Walk Dog", difficulty: 3, reward: 1)

Chore.create(kid_id: 1, task_id: 7, completed: false)
Chore.create(kid_id: 1, task_id: 11, completed: true)
Chore.create(kid_id: 1, task_id: 8, completed: true)
Chore.create(kid_id: 2, task_id: 7, completed: true)
Chore.create(kid_id: 2, task_id: 3, completed: true)
Chore.create(kid_id: 2, task_id: 4, completed: false)
Chore.create(kid_id: 3, task_id: 10, completed: false)
Chore.create(kid_id: 3, task_id: 1, completed: true)
Chore.create(kid_id: 4, task_id: 10, completed: true)
Chore.create(kid_id: 4, task_id: 1, completed: true)


