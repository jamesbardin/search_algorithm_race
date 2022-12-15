Our results from testing different sizes of mazes are as follows,


TESTING MAZE PUZZLE...
Regular BFS time:
time (msecs): 0.602961
Fast BFS time:
time (msecs): 0.351191
DFS time:
time (msecs): 0.081062
DONE TESTING MAZE PUZZLE, DISPLAYING MAZE NOW
TESTING MAZE PUZZLE...
Regular BFS time:
time (msecs): 0.322104
Fast BFS time:
time (msecs): 0.700951
DFS time:
time (msecs): 0.138044
DONE TESTING MAZE PUZZLE, DISPLAYING MAZE NOW
TESTING MAZE PUZZLE...
Regular BFS time:
time (msecs): 1.184940
Fast BFS time:
time (msecs): 1.813889
DFS time:
time (msecs): 0.312090
DONE TESTING MAZE PUZZLE, DISPLAYING MAZE NOW
TESTING MAZE PUZZLE...
Regular BFS time:
time (msecs): 0.585079
Fast BFS time:
time (msecs): 1.129866
DFS time:
time (msecs): 0.360966
DONE TESTING MAZE PUZZLE, DISPLAYING MAZE NOW
TESTING MAZE PUZZLE...
Regular BFS time:
time (msecs): 1.987934
Fast BFS time:
time (msecs): 2.403975
DFS time:
time (msecs): 0.796080
DONE TESTING MAZE PUZZLE, DISPLAYING MAZE NOW
TESTING MAZE PUZZLE...
Regular BFS time:
time (msecs): 3.479958
Fast BFS time:
time (msecs): 2.357960
DFS time:
time (msecs): 0.246048
DONE TESTING MAZE PUZZLE, DISPLAYING MAZE NOW
TESTING MAZE PUZZLE...
Regular BFS time:
time (msecs): 4.724979
Fast BFS time:
time (msecs): 3.042936
DFS time:
time (msecs): 0.439882
DONE TESTING MAZE PUZZLE, DISPLAYING MAZE NOW


Our average Regular BFS time is 1.841136

Our average Fast BFS time is 1.685824

Our average DFS time is 0.339167

As was to be expected, regular BFS has the slowest average times, and as we saw from the times 
listed from the command output above as the size of the maze increases, the longer it took to
solve the maze, and the increase was greater than the time increase DFS saw with the increased
maze sizes

And, the faster BFS had a slightly faster average time than regular BFS. And similarly to
the regular BFS, as the maze increased in size the times increased rapidly. 

Finally, DFS was significantly faster than the BFS times. There were interesting things that 
happened with the medium sized mazes, where they took longer to solve than the other mazes, I
assuming that it was just a random coincedence based on the seed value we chose. So, I tried
changing the seed value and found that they again all produced close values.





