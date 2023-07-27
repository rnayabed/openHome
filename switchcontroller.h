#ifndef SWITCHCONTROLLER_H
#define SWITCHCONTROLLER_H

#include <QObject>
#include <QQmlEngine>

class SwitchController : public QObject
{
    Q_OBJECT
    QML_ELEMENT

public:
    explicit SwitchController(QObject *parent = nullptr);

public slots:
    void setStatus(const int& pin, const bool& status);

private:
    void configureOutput(const int& pin);

};

#endif // SWITCHCONTROLLER_H
