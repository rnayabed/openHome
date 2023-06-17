#ifndef SWITCHCONTROLLER_H
#define SWITCHCONTROLLER_H

#include <QObject>
#include <QQmlEngine>

class SwitchController : public QObject
{
    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(bool switch1 READ switch1 WRITE setSwitch1 NOTIFY switch1Changed)
    Q_PROPERTY(bool switch2 READ switch2 WRITE setSwitch2 NOTIFY switch2Changed)
    Q_PROPERTY(bool switch3 READ switch3 WRITE setSwitch3 NOTIFY switch3Changed)
    Q_PROPERTY(bool switch4 READ switch4 WRITE setSwitch4 NOTIFY switch4Changed)
    Q_PROPERTY(bool switch5 READ switch5 WRITE setSwitch5 NOTIFY switch5Changed)
    Q_PROPERTY(bool switch6 READ switch6 WRITE setSwitch6 NOTIFY switch6Changed)
    Q_PROPERTY(bool switch7 READ switch7 WRITE setSwitch7 NOTIFY switch7Changed)
    Q_PROPERTY(bool switch8 READ switch8 WRITE setSwitch8 NOTIFY switch8Changed)
public:
    explicit SwitchController(QObject *parent = nullptr);

    const bool& switch1();
    const bool& switch2();
    const bool& switch3();
    const bool& switch4();
    const bool& switch5();
    const bool& switch6();
    const bool& switch7();
    const bool& switch8();


public slots:
    void setSwitch1(const bool& switch1);
    void setSwitch2(const bool& switch2);
    void setSwitch3(const bool& switch3);
    void setSwitch4(const bool& switch4);
    void setSwitch5(const bool& switch5);
    void setSwitch6(const bool& switch6);
    void setSwitch7(const bool& switch7);
    void setSwitch8(const bool& switch8);

signals:
    void switch1Changed();
    void switch2Changed();
    void switch3Changed();
    void switch4Changed();
    void switch5Changed();
    void switch6Changed();
    void switch7Changed();
    void switch8Changed();

private:
    bool m_switch1;
    bool m_switch2;
    bool m_switch3;
    bool m_switch4;
    bool m_switch5;
    bool m_switch6;
    bool m_switch7;
    bool m_switch8;

};

#endif // SWITCHCONTROLLER_H
