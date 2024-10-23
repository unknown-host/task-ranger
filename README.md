There is a list of tasks, each of them has duration and value parameters.
We need to rank the tasks to fit into a given time limit. An :id field was added for ease of input data modeling.

Preparation:
- Add a coefficient to each task to help with the ranking.
- Sort the tasks by the coefficient in ascending or descending order, depending on the algorithm.

Algorithm:
- Compute the difference between the total time limit and the sum of the durations of all tasks.
- If time_limit >= sum_tasks_duration, return the sorted list of tasks.
- Now we have a new definition: extra_time = sum_tasks_duration - time_limit.
- Extra time is for excessive tasks.
- Take tasks one by one from the descending sorted list of tasks, check the sum of durations of low coefficient tasks. If it's <= the extra time, add them to the excessive list.
- Now we have a list of extra tasks that we need to exclude from the list of all tasks. Return the updated list of all tasks.
