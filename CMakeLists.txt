cmake_minimum_required(VERSION 3.16)

project(TossGame VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appTossGame
    main.cpp
)

qt_add_qml_module(appTossGame
    URI TossGame
    VERSION 1.0
    QML_FILES
        Main.qml
        SOURCES
        QML_FILES
        QML_FILES GameButton.qml
        QML_FILES GameBoard.qml
        SOURCES gameanswer.h gameanswer.cpp
        QML_FILES ClockCircle.qml
        QML_FILES TimerBar.qml
        QML_FILES PassText.qml
        QML_FILES NonPassText.qml
        QML_FILES StartPage.qml
        QML_FILES NextButton.qml
        QML_FILES EndPage.qml
        QML_FILES EndText.qml
        QML_FILES MyText.qml

)
qt_add_resources(appTossGame "global_resources"
    PREFIX "/"
    FILES
        img.png
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appTossGame PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appTossGame
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appTossGame
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appTossGame
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
