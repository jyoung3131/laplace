CMAKE_MINIMUM_REQUIRED(VERSION 3.4)

MESSAGE( "==============================" )
MESSAGE( "Configuring Jacobi test app" )
MESSAGE( "==============================" )

SET( CMAKE_CXX_COMPILER_WORKS:STRING=1)
set(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "/usr/lib/gcc/x86_64-linux-gnu/5")
set(CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS "/usr/lib/gcc/x86_64-linux-gnu/5")

PROJECT( JACOBI CXX )

MESSAGE (" LDFLAGS ARE " ${LDFLAGS} )
MESSAGE (" LDLIBS ARE " ${LDLIBS} )

# Check if we are using an MPI compiler
SET( CMAKE_REQUIRED_FLAGS ${CMAKE_CXX_FLAGS} )
IF ( USE_MPI )
    ADD_DEFINITIONS( -DUSE_MPI )
    MESSAGE( "Using MPI" )
ENDIF()


# Enable OpenMP
IF ( USE_OPENMP )
    ADD_DEFINITIONS( -DUSE_OPENMP )
    IF ( USING_GCC )
        SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fopenmp")
        SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fopenmp -stdlib=libc++")
    ELSEIF ( USING_CRAY )
    ELSEIF ( USING_PGCC )
        #SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -openmp")
        #SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -openmp")
        SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mp")
        SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mp")
    ELSEIF ( USING_CLANG )
        SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fopenmp -pthread")
        SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fopenmp -pthread -stdlib=libc++")
    ELSEIF ( USING_XL )
        SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -qsmp=omp")
        SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -qsmp=omp")
    ELSE()
        MESSAGE(FATAL_ERROR "Compiling with OpenMP is not yet set for this compiler")
    ENDIF()
    MESSAGE( "Using OpenMP" )
ENDIF()

SET(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/lib)
SET( SOURCES laplace2d.c )
ADD_EXECUTABLE( laplace_cmake laplace2d.c)


