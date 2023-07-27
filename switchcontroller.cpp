#include "switchcontroller.h"

#include <QProcess>


void SwitchController::configureOutput(const int& pin)
{
    QProcess process;

    connect(&process, &QProcess::readyReadStandardOutput, this, [&process](){
        qDebug() << process.readAllStandardOutput();
    }, Qt::SingleShotConnection);

    connect(&process, &QProcess::readyReadStandardError, this, [&process](){
        qDebug() << process.readAllStandardError();
    }, Qt::SingleShotConnection);

    process.startDetached("raspi-gpio", QStringList() << "set" << QString::number(pin) << "op");
}

void SwitchController::setStatus(const int& pin, const bool& status)
{
    QProcess process;

    connect(&process, &QProcess::readyReadStandardOutput, this, [&process](){
        qDebug() << process.readAllStandardOutput();
    }, Qt::SingleShotConnection);

    connect(&process, &QProcess::readyReadStandardError, this, [&process](){
        qDebug() << process.readAllStandardError();
    }, Qt::SingleShotConnection);

    process.startDetached("raspi-gpio", QStringList() << "set" << QString::number(pin) << (status ? "dl" : "dh"));
}

SwitchController::SwitchController(QObject *parent)
    : QObject{parent}
{
    /*
     * raspi-gpio set 2 op
raspi-gpio set 3 op
raspi-gpio set 4 op

raspi-gpio set 17 op
raspi-gpio set 27 op
raspi-gpio set 22 op

raspi-gpio set 10 op
raspi-gpio set 9 op
*/

    for (size_t i = 2; i <= 25; i++)
    {
        configureOutput(i);
        setStatus(i, false);
    }
}

