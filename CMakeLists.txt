cmake_minimum_required(VERSION 3.16)

project(TradingProject VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appTradingProject
    main.cpp
    tradingengine.cpp
    datamanager.cpp
    ordermodel.cpp
    portfoliomanager.cpp
)

qt_add_qml_module(appTradingProject
    URI TradingProject
    VERSION 1.0
    QML_FILES
        Main.qml
        TradingTab.qml
        PortfolioTab.qml
        AnalyticsTab.qml
        SettingsTab.qml
    SOURCES
        tradingengine.h
        tradingengine.cpp
        datamanager.h
        datamanager.cpp
        ordermodel.h
        ordermodel.cpp
        portfoliomanager.h
        portfoliomanager.cpp
    RESOURCES
        resources.qrc
)

set_target_properties(appTradingProject PROPERTIES
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appTradingProject
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appTradingProject
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
