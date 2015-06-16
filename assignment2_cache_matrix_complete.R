# Caches the inverse of a matrix

#Description: The following function calculates the inverse
#of matrices and saves it as a cache. Then the next time a user
#calculates the inverse the value will be immediately return
#instead of recalculating it again.

makeCacheMatrix <- function(x = matrix()) {
  #creates an empty matrix function
  
  transpose <- NULL
  #creates the empty variable 
  #which will become the transposed cache of the matrix
  
  set <- function(y) {
    #defines input variable and innitializes the 
    #cache variable to the parent environment
    x <<- y
    transpose <<- NULL
  }
  get <- function() x
  #returns the matrix(x)
  setinverse <- function(inverse) transpose <<- inverse
  #sets cache = to inverse of matrix(x)
  getinverse <- function() transpose
  #returns inverse cache
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

cacheSolve <- function(x, ...) {
  # Returns an inverse matrix of matrix(x)
  
  transpose <- x$getinverse()
  if(!is.null(transpose)) {
    #checks to see if there exists a cache version transposed
    message("getting cached data")
    return(transpose)
    #if there is then it calls that transposed matrix
  }
  data <- x$get()
  #skips the computation and gets the data otherwise
  #finds the inverse of the matrix
  transpose <- solve(data, ...)
  x$setinverse(transpose)
  transpose
}

#Testing: Tests to make sure the code works. 
data <- matrix(c(1,2,3,4), ncol = 2)
  #creates a 2x2 matrix of 1,2 in column 1 and 3,4 in col 2
matrix_make <- makeCacheMatrix(data)
  #Calls the make cache function
matrix_transp <- cacheSolve(matrix_make)
  #Calls the solver function
print(matrix_transp)
  #Prints solution

#Expected output:
#      [,1] [,2]
#[1,]   -2  1.5
#[2,]    1 -0.5
