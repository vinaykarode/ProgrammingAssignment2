
## This function accepts a matrix and caches the matrix into memeory
## and outputs a list of functions to set/get the matrix/inverse

makeCacheMatrix <- function(matrix = matrix()) {
        inverse <- NULL                         # initialise 'inverse' variable
        set_mat <- function(y){                 # store 'matrix' in different environment
                matrix <<- y
                inverse <<- NULL
        }
        get_mat <- function() {                 # acess the stored 'matrix' 
                matrix                            
        }
        set_inv <- function(solved_inverse){    # store 'inverse' in different environment
               inverse<<- solved_inverse
        }
        get_inv <- function(){                  # access the stored 'inverse' 
                inverse
        }
        list(set_matrix = set_mat,              # return a list of functions
             get_matrix = get_mat,
             set_inverse = set_inv,
             get_inverse = get_inv)
}


## This function accepts the list created in the above function
## and check if an inverse exists in the matrix and if it does 
## just return the cached inverse, else create an inverse and 
## store it into the list

cacheSolve <- function(x, ...) {
        inverse <- x$get_inverse()             # Return the inverse of the 'x'
        if(!is.null(inverse)){                 # return cached inverse if one exists
                message('getting cached inverse of matrix')
                inverse
        }
        data <- x$get_matrix()                 # get the stored matrix to solve for inverse
        i <- solve(data, ...)                  # solve for inverse of matrix
        x$set_inverse(i)                       # store the solved inverse
        i                                      # return solved inverse
}
