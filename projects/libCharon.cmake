ExternalProject_Add(libCharon
    GIT_REPOSITORY https://github.com/Ultimaker/libCharon
    GIT_TAG origin/${LIBCHARON_BRANCH_OR_TAG}
    GIT_SHALLOW 1
    STEP_TARGETS update
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${EXTERNALPROJECT_INSTALL_PREFIX} -DCMAKE_PREFIX_PATH=${CMAKE_PREFIX_PATH} -DCURA_PYTHON_VERSION=${CURA_PYTHON_VERSION} -DPython3_EXECUTABLE="${CMAKE_PREFIX_PATH}/bin/python3.8"
)

SetProjectDependencies(TARGET libCharon)

add_dependencies(update libCharon-update)
