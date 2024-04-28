cmake_minimum_required(VERSION 2.8) # проверка версии

add_executable(hello hello.cpp) # создать исполняемый файл hello из исходника hello.cpp

if(UNIX)
    message("This is a ${CMAKE_SYSTEM_NAME} system")
elseif(WIN32)
    message("This is a Windows System")
endif()