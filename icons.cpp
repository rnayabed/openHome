/*
 * Copyright (C) 2023 Debayan Sutradhar (rnayabed) (debayansutradhar3@gmail.com)
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

#include <QString>
#include "icons.h"

using namespace Qt::Literals::StringLiterals;

QString Icons::get(const int &icon)
{
    switch (icon)
    {
    case Icon::NightsStay:
        return u"qrc:/icons/nights_stay.svg"_s;
    case Icon::Bolt:
        return u"qrc:/icons/bolt.svg"_s;
    case Icon::EventNote:
        return u"qrc:/icons/event_note.svg"_s;
    case Icon::BulbOff:
        return u"qrc:/icons/bulb_off.svg"_s;
    case Icon::BulbOn:
        return u"qrc:/icons/bulb_on.svg"_s;
    case Icon::TVOff:
        return u"qrc:/icons/tv_off.svg"_s;
    case Icon::TVOn:
        return u"qrc:/icons/tv_on.svg"_s;
    case Icon::Fan:
        return u"qrc:/icons/fan.svg"_s;
    case Icon::AirWave:
        return u"qrc:/icons/air_wave.svg"_s;
    case Icon::BlindsDown:
        return u"qrc:/icons/blinds_down.svg"_s;
    case Icon::BlindsUp:
        return u"qrc:/icons/blinds_up.svg"_s;
    }

    return QString();
}
