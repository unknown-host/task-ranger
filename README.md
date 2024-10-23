There is a list of tasks, each of them has a duration and a value parameters.
We need to range the tasks to fit into a given time limit.

Preparation:
- Add a coefficient(duration / value) to each task to help with the ranking.
- Sort the tasks by the coefficient in asc(desc)ending order, depends on the algorythm.

Algorythm:
- Compute the difference between the total time and the sum of the duration fields of the list of tasks. 
- If time_limit >= sum_tasks_duration, return sorted list of tasks.
- Now we have a new defenition, extra_time = time_limit - sum_tasks_duration.
- Extra time - for excessive tasks. 
Take tasks one by one from descending sorted list of tasks, check sum of durations of low coefficient tasks. If its <= the extra time - add them to the excessive list.
- Now we have a list of extra tasks that we need to exclude from list of all tasks. Return new list of all tasks.
