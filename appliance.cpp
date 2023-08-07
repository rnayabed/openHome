#include "appliance.h"

Appliance::Appliance(const QString &title, const Icons::Icon &offIcon, const Icons::Icon &onIcon)
    : title{title}, offIcon{offIcon}, onIcon{onIcon}
{}

Appliance::Appliance(const QString &title, const ApplianceType::Type &type, const Icons::Icon &staticIcon)
    : title{title}, type{type}, staticIcon{staticIcon}
{}
