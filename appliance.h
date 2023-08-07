#ifndef APPLIANCE_H
#define APPLIANCE_H

#include <QString>
#include "icons.h"
#include "appliancetype.h"

struct Appliance
{

    Appliance(const QString& title,
              const ApplianceType::Type& type,
              const Icons::Icon& staticIcon);

    Appliance(const QString& title,
              const Icons::Icon& offIcon,
              const Icons::Icon& onIcon);

    QString title;

    ApplianceType::Type type = ApplianceType::Normal;

    Icons::Icon staticIcon = Icons::None;
    Icons::Icon onIcon = Icons::None;
    Icons::Icon offIcon = Icons::None;
};

#endif // APPLIANCE_H
