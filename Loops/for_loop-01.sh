#Syntax: for ( initialization; Condition; increment )

# Print numbers from 1 to 10 using a for loop.

#!/bin/bash
 
for (( i=1; i<=10; i++ ))
do 
  echo "output: $i"
done  

# #Print even numbers between 1 to 20.

max=20

for (( i=1; i<=max; i++ ))
do 
   if (( i%2 == 0)); then
   echo "even number is: $i"
   fi
done   


#Sum all numbers from 1 to N (user input)

read -p "enter the num: " num

for (( i=1; i<=num; i++ ))
do 

  sum=$((sum+i))
  
done  
   echo "sum of the all numbers till $num: $sum"
   

# Sum all numbers from 1 to N using arithmetic formula
read -p "enter the num: " num   

sum=$((num*(num+1)/2))
 echo "sum of the all numbers till $num: $sum"