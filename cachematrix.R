## A pair of functions that cache the inverse of a matrix.

## makeCacheMatrix creates a special "matrix", which is really a list containing a function to
## set the value of the matrix
## get the value of the matrix
## set the value of the inverse
## get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
       x <<- y
       inv <<- NULL
  }
    get <- function() x
    setinv <- function(inverse) inv <<- inverse
    getinv <- function() inv
    list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## cacheSolve calculates the inverse of the special "matrix" created with the above function. 
## If the inverse has already been calculated, it gets the inverse from the cache and skips the computation.
## Otherwise, it calculates the inverse of the data and sets the value of the inverse in the cache via the setinv function.

cacheSolve <- function(x, ...) {
    inv <- x$getinv()
    if(!is.null(inv)) {
       message("getting cached data")
       return(inv)
  }
    data <- x$get()
    inv <- sovle(data, ...)
    x$setinv(inv)
    inv
}
