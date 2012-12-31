Php Solutions
-------------

# For Loop Summing

   This solution reflects the spirit of the canonical solution contained in 
   Project Euler's PDF. The canonical solution uses a defined function, then 
   calls it thrice: once to sum factors of 3, once for factors of 5 and lastly 
   to sum factors of 15: F(3) + F(5) - F(15). I used a single for loop in
   fully proceedural code.
  
   This uses a test nested within a for loop. The test contains two conditions
   and sums at once.
  
   Some posted solutions for PHP append each sum into an array and then add 
   them at the end. I think that takes more memory than addition+substitution 
   in place.
  
   My rendition of the solution also appends an EOL char so it leaves a clean console :-)
