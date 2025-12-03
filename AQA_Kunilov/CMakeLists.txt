cmake_minimum_required(VERSION 3.16)

project(AQA_Kunilov VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)
find_package(Qt6 REQUIRED COMPONENTS Core)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appAQA_Kunilov
    main.cpp
)

set_source_files_properties(Theme.qml
PROPERTIES QT_QML_SINGLETON_TYPE TRUE)
set_source_files_properties(IconSets.qml
PROPERTIES QT_QML_SINGLETON_TYPE TRUE)

qt_add_qml_module(appAQA_Kunilov
    URI AQA_Kunilov
    QML_FILES
        Main.qml
        QML_FILES ColorVectorImage.qml
    RESOURCES
        icons/baby-carriage.svg
        icons/baby.svg
        icons/child-dress.svg
        icons/child.svg
        icons/circle-half-stroke.svg
        icons/futbol.svg
        icons/hand.svg
        icons/leaf.svg
        icons/lungs.svg
        icons/mars.svg
        icons/person-cane.svg
        icons/person-dress.svg
        icons/person.svg
        icons/play.svg
        icons/power-off.svg
        icons/venus.svg
        QML_FILES RoundedButton.qml
        QML_FILES Theme.qml
        QML_FILES IconSets.qml
        QML_FILES RoundedTextButton.qml
        QML_FILES PulsingImage.qml
        SOURCES backend.h backend.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appAQA_Kunilov PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appAQA_Kunilov
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appAQA_Kunilov
    PRIVATE Qt6::Quick
)
target_link_libraries(appAQA_Kunilov PRIVATE Qt6::Core)

include(GNUInstallDirs)
install(TARGETS appAQA_Kunilov
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
