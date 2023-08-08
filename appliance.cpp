#include "appliance.h"

Appliance::Appliance(const QString &title, const Icons::Icon &offIcon, const Icons::Icon &onIcon, const int& pin)
    : title{title}, offIcon{offIcon}, onIcon{onIcon}, pin{pin}
{}

void Appliance::toggle()
{
    status = !status;
}

Appliance::Appliance(const QString &title, const ApplianceType::Type &type, const Icons::Icon &staticIcon, const int& pin)
    : title{title}, type{type}, staticIcon{staticIcon}, pin{pin}
{}
