#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDirIterator>
#include <QFont>
#include <QFontDatabase>

#include "switchcontroller.h"


using namespace Qt::Literals::StringLiterals;

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);


    SwitchController switchController;

    QQmlApplicationEngine engine;

   /* QDirIterator it(":", QDirIterator::Subdirectories);
    while (it.hasNext()) {
        qDebug() << it.next();
    }*/

    const QUrl url(u"qrc:/openHome/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
                     &app, []() { QCoreApplication::exit(-1); },
    Qt::QueuedConnection);

    engine.setContextForObject(&switchController, engine.rootContext());
    engine.rootContext()->setContextProperty(u"switchController"_s, &switchController);

    engine.load(url);

    /*QGuiApplication::setFont(QFont(QFontDatabase::applicationFontFamilies(
                                       QFontDatabase::addApplicationFont(":/openHome/fonts/Lato-Regular.ttf"))
                                   .at(0)));*/
   /* app.setFont(QFont(QFontDatabase::applicationFontFamilies(
                          QFontDatabase::addApplicationFont(":/openHome/fonts/Lato-Regular.ttf"))
                      .at(0)));*/


    return app.exec();
}
