# Single entry point for all external dependencies.
include(FetchContent)

include(disa)
if(REPENS_ENABLE_TESTS)
  include(catch2)
endif()
