#ifndef TIMECONTROLLER_H
#define TIMECONTROLLER_H

#include <QObject>
#include <QQmlEngine>

class TimeController : public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:
    TimeController(QObject* parent = nullptr);
};

#endif // TIMECONTROLLER_H
