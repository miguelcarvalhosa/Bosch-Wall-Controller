QT += qml quick widgets charts

CONFIG += c++11 disable-desktop qtvirtualkeyboard.pro


# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        backend.cpp \
        libSonar.cpp \
        main.cpp \
        uart.cpp

RESOURCES += qml.qrc \
    resource_file.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    #../../../../raspi/sysroot/usr/include/python2.7/Python.h \
    backend.h \
    centralUnit.h \
    libSonar.h \
    uart.h

INSTALLS        = target
target.files    = GUI-v2
target.path     = /home/pi

LIBS += -L /home/miguel/raspi/sysroot/usr/lib/python2.7 -lpython2.7
INCLUDEPATH += /home/miguel/raspi/sysroot/usr/include/python2.7
DEPENDPATH += /home/miguel/raspi/sysroot/usr/include/python2.7

INCLUDEPATH += /home/miguel/raspi/sysroot/usr/include/
LIBS += -L"/home/miguel/raspi/sysroot/usr/lib"
LIBS += -lwiringPi
