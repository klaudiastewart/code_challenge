## Summary

This program allows a user to run a data set of names and gather information about those names. The data file name is arbitrary and can be changed at any point, but in this case, I call it `data.txt`.

The requested output is below: 

1. The unique count of full names (i.e. duplicates are counted only once)
2. The unique count of last names
3. The unique count of first names
4. The ten most common last names (the names and number of occurrences)
5. The ten most common first names (the names and number of occurrences)
6. A list of 25 specially unique names (see below for details)
7. A list of 25 modified names (see below for details)

The answer to this output can be found in `output.txt` or can be read from the screenshot below. 

![image](https://i.ibb.co/8m6cCPy/Screen-Shot-2021-06-07-at-6-51-09-PM.png)

## Running the program
To run this program:

1. Clone this repo onto your local computer 
2. Run command `ruby code.rb`. This will generate the output. 
3. If you'd like to change the `specially_unique` and `modified_names`, simply go to the `code.rb` file within your text editor and edit the argument value on lines 98 and 99. If you'd like to give this data set a different file name, simply change the argument on line 92 of `code.rb`
