qt_add_library(Fileio STATIC)
qt6_add_qml_module(Fileio
    PLUGIN_TARGET
    VERSION 1.0
    URI "Fileio"
    SOURCES
        fileio.h
        fileio.cpp
)
