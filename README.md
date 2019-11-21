All the programs in question 1 and 3 are written in python3. This file contains information on how to run the code and observations. There are sample output files in the sample_results folder.

Running the Code - 
    Question 1:
        a) Both files have two variables on the top named "datafile" and "commandfile" which are supposed to contain the file name where the data and the list of commands are.  
            (Please make sure the path is correct)  
        b) To run the btree part you will need to install the module named Btress (https://pythonhosted.org/BTrees/).  
        c) The commands to run the code are:  
            i) python3 1_hash_vvb238_nr2229.py  
            ii) python3 1_btree_vvb238_nr2229.py  
        d) These two commands will generate two files each containing the time taken to run the 60 commands and the updated table.  

    Question 3:  
        a) Both files have a variable on the top named "datafile" which is supposed to contain the file name where the data is kept.  
            (Please make sure the path is correct)  
        b) To run the code you will need to install the module named mysql (https://dev.mysql.com/doc/connector-python/en/connector-python-installation.html).  
        c) The commands to run the code are:  
            i) python3 3a_vvb238_nr2229.py  
            ii) python3 3b_vvb238_nr2229.py  
        d) These two commands will generate a file containing the time taken to input the 100,000 records.  
  
Observations -   
    Question 1:  
        We can see that the fetching a record using = becomes faster because we are keeping hash and btree of that column and searching through those is more effiecient than doing a linear search on the whole collection. Hash is faster than Btree but has limited functionality. Operators such as >, <, <=, >= on columns dont use hashtable.  
    Question 2:
        Tables produced by the queries are in the specific files as comments.
        a) We observed that after creating the index the time to execute the same query reduces. For the first query, to find the number of employees who earn at least 50 more than their managers, we created indexes for Employee ID and Manager, since we are equating Manager and ID in the where clause. Creating an index here, helps referencing faster and hence fetches the query faster. 
            Time taken to execute the query without the index: 0.76 sec, 
            Time taken to execute the query after adding index: 0.34 sec
            Improvement in executing query: 0.42 sec
        b) Similarly, we can say that by creating an index for EmpID on course, and an index for ID on Employee reduces the time for the second query. 
            Time taken to execute the query without the index: 51.78 sec, 
            Time taken to execute the query after adding index: 0.46 sec
            Improvement in executing query: 51.32 sec
        c) The third query equated the EmpID from courses and ID from Employee, hence by creating a reference on these columns, it becomes faster to query.
            Time taken to execute the query without the index: 0.05 sec, 
            Time taken to execute the query after adding index: 0.01 sec
            Improvement in executing query: 0.04 sec
        We could also see that creating additional indexes can cause performance to decrease on some queries.
    Question 3:  
        As we start inserting records into the table, we can see a significant lag while inserting when indexes are created on specific columns. MySQL defaults to using Btrees while creating indexes unless mentioned "USING HASH" (Hashing can't be created for multi-valued columns). While inserting into the table, time has to be spent to balance the btree and that causes the delay. This delay does not exist while inserting without indexes.  
