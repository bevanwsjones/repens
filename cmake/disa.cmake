FetchContent_Declare(
  disa
  GIT_REPOSITORY https://github.com/bevanwsjones/disa.git
  GIT_TAG        4533cc07e83fcb229c3ddfcce6f74bffdafdfc15
)

set(ENABLE_TEST OFF CACHE BOOL "" FORCE)

FetchContent_MakeAvailable(disa)
