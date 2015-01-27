## Create a matrix object with getter and setter for the matrix
## and getter for inverse form, which will be calculated and cached
## after first request 

makeCacheMatrix <- function(x = matrix()) {
  invMatrix <- NULL
  
  get <- function() x
  
  set <- function(m) {
    x <<- m
    invMatrix <<- NULL
  }
    
  getInv <- function() {
    if (is.null(invMatrix))
      invMatrix <- solve(x)

    invMatrix
  }
  
  list(get = get, set = set, getInv = getInv)
}


## Just return a value

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  x$getInv()
}
