#
# Check if the function exists.
#
# CHECK_FUNCTION_EXISTS - macro which checks if the function exists
# FUNCTION - the name of the function
# VARIABLE - variable to store the result
#

MACRO(CHECK_FUNCTION_EXISTS FUNCTION VARIABLE)
  TRY_COMPILE(${VARIABLE}
             ${PROJECT_BINARY_DIR}
             ${CMAKE_ROOT}/Modules/CheckFunctionExists.c
             COMPILE_DEFINITIONS -DCHECK_FUNCTION_EXISTS=${FUNCTION} 
             OUTPUT_VARIABLE OUTPUT)
  IF(NOT ${VARIABLE})
    WRITE_FILE(${PROJECT_BINARY_DIR}/CMakeError.log 
      "Determining if the function ${FUNCTION} exists failed with the following output:\n"
      "${OUTPUT}\n")
  ENDIF(NOT ${VARIABLE})
ENDMACRO(CHECK_FUNCTION_EXISTS)
