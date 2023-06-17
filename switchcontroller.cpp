#include "switchcontroller.h"

#include <QProcess>

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
    QProcess::execute("raspi-gpio set 2 op");
    QProcess::execute("raspi-gpio set 3 op");
    QProcess::execute("raspi-gpio set 4 op");


    QProcess::execute("raspi-gpio set 17 op");
    QProcess::execute("raspi-gpio set 27 op");
    QProcess::execute("raspi-gpio set 22 op");


    QProcess::execute("raspi-gpio set 10 op");
    QProcess::execute("raspi-gpio set 9 op");
    QProcess::execute("raspi-gpio set 11 op");
}

const bool &SwitchController::switch1()
{
    return m_switch1;
}

const bool &SwitchController::switch2()
{
    return m_switch2;
}

const bool &SwitchController::switch3()
{
    return m_switch3;
}

const bool &SwitchController::switch4()
{
    return m_switch4;
}

const bool &SwitchController::switch5()
{
    return m_switch5;
}

const bool &SwitchController::switch6()
{
    return m_switch6;
}

const bool &SwitchController::switch7()
{
    return m_switch7;
}

const bool &SwitchController::switch8()
{
    return m_switch8;
}

void SwitchController::setSwitch1(const bool &switch1)
{
    if (switch1 == m_switch1)
        return;

    m_switch1 = switch1;

    emit switch1Changed();

    if (m_switch1)
        QProcess::execute("raspi-gpio set 2 dl");
    else
        QProcess::execute("raspi-gpio set 2 dh");
}

void SwitchController::setSwitch2(const bool &switch2)
{
    if (switch2 == m_switch2)
        return;

    m_switch2 = switch2;

    emit switch2Changed();

    if (m_switch2)
        QProcess::execute("raspi-gpio set 3 dl");
    else
        QProcess::execute("raspi-gpio set 3 dh");
}

void SwitchController::setSwitch3(const bool &switch3)
{
    if (switch3 == m_switch3)
        return;

    m_switch3 = switch3;

    emit switch3Changed();

    if (m_switch3)
        QProcess::execute("raspi-gpio set 4 dl");
    else
        QProcess::execute("raspi-gpio set 4 dh");
}

void SwitchController::setSwitch4(const bool &switch4)
{
    if (switch4 == m_switch4)
        return;

    m_switch4 = switch4;

    emit switch4Changed();

    if (m_switch4)
        QProcess::execute("raspi-gpio set 17 dl");
    else
        QProcess::execute("raspi-gpio set 17 dh");
}

void SwitchController::setSwitch5(const bool &switch5)
{
    if (switch5 == m_switch5)
        return;

    m_switch5 = switch5;

    emit switch5Changed();

    if (m_switch5)
        QProcess::execute("raspi-gpio set 27 dl");
    else
        QProcess::execute("raspi-gpio set 27 dh");
}

void SwitchController::setSwitch6(const bool &switch6)
{
    if (switch6 == m_switch6)
        return;

    m_switch6 = switch6;

    emit switch5Changed();

    if (m_switch6)
        QProcess::execute("raspi-gpio set 22 dl");
    else
        QProcess::execute("raspi-gpio set 22 dh");
}

void SwitchController::setSwitch7(const bool &switch7)
{
    if (switch7 == m_switch7)
        return;

    m_switch7 = switch7;

    emit switch5Changed();

    if (m_switch7)
        QProcess::execute("raspi-gpio set 10 dl");
    else
        QProcess::execute("raspi-gpio set 10 dh");
}


void SwitchController::setSwitch8(const bool &switch8)
{
    if (switch8 == m_switch8)
        return;

    m_switch8 = switch8;

    emit switch5Changed();

    if (m_switch8)
        QProcess::execute("raspi-gpio set 9 dl");
    else
        QProcess::execute("raspi-gpio set 9 dh");
}
