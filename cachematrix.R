## Assignment is to write a pair of functions that cache the inverse of a matrix.

## makeCacheMatrix: This function creates a special "matrix" object 
## that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  invm <- NULL
  
  set <- function(y) {
    x <<- y
    invm <<- NULL
  }
  
  get <- function() x
  setinverse <- function(inverse) invm <<- inverse
  getinverse <- function() invm
  
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

## cacheSolve: This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. If the inverse has already been calculated 
## (and the matrix has not changed), then cacheSolve should retrieve the inverse 
## from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'

  invm <- x$getinverse()
  
  if(!is.null(invm)) {
    message("getting cached data")
    return(invm)
  }
  
  data <- x$get()
  invm <- solve(data, ...)
  x$setinverse(invm)
  invm 
}
