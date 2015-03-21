## These functions cache the inverse of a special "matrix" and can retrieve it
## if the inverse has already been calculated

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) { ## creates a special "matrix"
                cache_inv <- x
                getinvmatrix <- function() cache_inv
                setinvmatrix <- function(solve) cache_inv
                            cache_inv <<- y
                             ## caches the inverse of the special "matrix"
                list(get = getinvmatrix, set = setinvmatrix)
                }


## This function computes the inverse of the special "matrix" returned 
## by makeCacheMatrix above. If the inverse has already been calculated, 
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
          ## Return a matrix that is the inverse of 'x'
          cache_inv <- x$getinvmatrix()
          if (!is.null(cache_inv)) {
                    message("getting cached data")
                    return(cache_inv)
                    } ## computes the inverse of the special "matrix" and determine
                      ## if the inverse has already been calculated
          data <- x$get()
          cache_inv <- solve(data,...)
          x$setinvmatrix(cache_inv)
          cache_inv  ## Returns the inverse from the cache
}
