#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "switchcontroller.h"


using namespace Qt::Literals::StringLiterals;

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    SwitchController switchController;

    engine.setContextForObject(&switchController, engine.rootContext());
    engine.rootContext()->setContextProperty(u"switchController"_s, &switchController);


    const QUrl url(u"qrc:/openHome/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
                     &app, []() { QCoreApplication::exit(-1); },
    Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
