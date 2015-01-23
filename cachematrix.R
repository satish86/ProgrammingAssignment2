## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# --------------------------------------------------------------------------------
### * Variable 'm' is initiates to save the inverse matrix (as Cached data)
### * Function get() obtains input matrix  and function setmatrix() assigns the inverse matrix of x to m
### * getImatrix() function obtains the cached inverse matrix.
### This function creates a special R object that
## -----------------------------------------------------------------------------
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmatrix <- function(solve) m <<- solve
  getmatrix <- function() m
  list(get = get,setmatrix = setmatrix,getmatrix = getmatrix)
}
### Write a short comment describing this function
## --------------------------------------------------------------------------------
#### This function inverses the matrix 
### First it check if the matrix has been cached if not this function caches it.
### * data <- x$get() : obtains matrix from object x
### * m <- solve(data) : Inverses matrix
### * x$setImatrix(m) : Assigns inversed matrix to x
## --------------------------------------------------------------------------------
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getmatrix()
  if(!is.null(m)) {
    message("Getting cached data.")
    return(m)
  }
  else{
    message("No cached data available. Calculate inverse matrix")
  data <- x$get()
  m <- solve (data, ...)
  x$setmatrix(m)
  return(m)
  }    
}
