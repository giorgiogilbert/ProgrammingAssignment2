## Put comments here that give an overall description of what your
## functions do

## Make an object with 2 properties: matrix value and matrix inverse
## , along with get/set method for both properties

makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  set <- function(value){
    x <<-value
    inverse <<- NULL
  }
  get <- function(){
    x
  }
  getInverse <- function(){
    inverse
  }
  setInverse <- function(value){
    inverse <<- value
  }
  list( set=set, get=get, getInverse=getInverse, setInverse=setInverse )
}


## Get a matrix inverse from cached value, or compute it if not cached yet 

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    cachedInverse <- x$getInverse()
    if( is.null(cachedInverse) ){
       print("Computing inverse since it was not cached yet")
       cachedInverse <- solve( x$get(), ... )
       x$setInverse( cachedInverse )
    }
    cachedInverse
}
