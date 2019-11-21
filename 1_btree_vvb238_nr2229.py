import numpy as np
import time
from BTrees.OOBTree import OOBTree

datafile = 'myindex.txt'
commandfile = 'commands.txt'
lineno = 0
hashmap = {}
btree = OOBTree()

# Reading from file
collection = np.genfromtxt(datafile, dtype = None, delimiter = '|', names = True, autostrip = True)

# Building the tree
column = 'key'
for row in range(len(collection)):
    hashmap[collection[row][column]] = row
btree.update(hashmap)
print('Created a BTree on ' + column + ' for the collection')

search_answers = []
with open(commandfile) as fp:
    each_line = 1
    lineno = 0
    start_time = time.time()
    while each_line:
        lineno += 1
        each_line = fp.readline()
        operation = each_line[:each_line.find('(')]
        
        if operation == 'insert':
            parameters = each_line[each_line.find('(')+1:each_line.find(')')]
            key, value = parameters.split(',')
            key, value = int(key), int(value)
            if key in btree:
                collection[btree[key]]['value'] = value
            else:
                collection = np.append(collection, np.array([(key,value)], dtype=collection.dtype))
                btree.update({key: len(collection) - 1}) 
        elif operation == 'delete':
            parameters = each_line[each_line.find('(')+1:each_line.find(')')]
            key = int(parameters)
            if key in btree:
                btree[key] = -1
            else:
                print("not present")
        elif operation == 'search':
            parameters = each_line[each_line.find('(')+1:each_line.find(')')]
            key = int(parameters)
            if key in btree and btree[key] != -1:
                search_answers.append(collection[btree[key]]['value'])
                print(collection[btree[key]]['value'])
            else:
                search_answers.append("not present")
                print("not present")
    total_time = time.time() - start_time
    
np.savetxt('1_btree_vvb238_nr2229_resultTable.txt', collection, fmt='%d', delimiter = '|', header='key|value')
answerFile = open("1_btree_vvb238_nr229_timing.txt", "a")
answerFile.write("The total time taken to execute the commands is : " + str(total_time) + " seconds")
answerFile.close()