#ifndef SWITCHCONTROLLER_H
#define SWITCHCONTROLLER_H

#include <QObject>
#include <QQmlEngine>

class SwitchController : public QObject
{
    Q_OBJECT
public:
    explicit SwitchController(QObject *parent = nullptr);
    void setStatus(const int& pin, const bool& status);
    void init();

    static SwitchController& instance();

private:
    void configureOutput(const int& pin);

};

#endif // SWITCHCONTROLLER_H
