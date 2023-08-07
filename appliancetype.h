#ifndef APPLIANCETYPE_H
#define APPLIANCETYPE_H

#include <QObject>
#include <QQmlEngine>

class ApplianceType : public QObject
{
    Q_OBJECT
    QML_ELEMENT

public:
    enum Type
    {
        Normal = 0,
        Static,
        Rotate
    };

    Q_ENUM(Type)
};

#endif // APPLIANCETYPE_H
