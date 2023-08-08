#include <QList>
#include "roommodel.h"
#include "appliancemodel.h"

RoomModel::RoomModel()
{
    QSharedPointer<QAbstractListModel> bedRoom{new ApplianceModel{
            QList{Appliance {
                    "TV",
                    Icons::TVOff,
                    Icons::TVOn,
                    2
                }, Appliance {
                    "Lights",
                    Icons::BulbOff,
                    Icons::BulbOn,
                    3
                }, Appliance {
                    "AC",
                    ApplianceType::Type::Static,
                    Icons::AirWave,
                    4
                }, Appliance {
                    "Fan",
                    ApplianceType::Type::Rotate,
                    Icons::Fan,
                    17
                }, Appliance {
                    "Test dev 1",
                    ApplianceType::Type::Static,
                    Icons::None,
                    -1
                }, Appliance {
                    "Test dev 2",
                    ApplianceType::Type::Static,
                    Icons::None,
                    -1
                }, Appliance {
                    "Test dev 3",
                    ApplianceType::Type::Static,
                    Icons::None,
                    -1
                }, Appliance {
                    "Test dev 4",
                    ApplianceType::Type::Static,
                    Icons::None,
                    -1
                }, Appliance {
                    "Test dev 5",
                    ApplianceType::Type::Static,
                    Icons::None,
                    -1
                }, Appliance {
                    "Test dev 6",
                    ApplianceType::Type::Static,
                    Icons::None,
                    -1
                }, Appliance {
                    "Test dev 7",
                    ApplianceType::Type::Static,
                    Icons::None,
                    -1
                }}
        }};

    QSharedPointer<QAbstractListModel> livingRoom{new ApplianceModel{
            QList{Appliance {
                    "Lights",
                    Icons::BulbOff,
                    Icons::BulbOn,
                    7
                }, Appliance {
                    "AC",
                    ApplianceType::Type::Static,
                    Icons::AirWave,
                    19
                }, Appliance {
                    "TV",
                    Icons::TVOff,
                    Icons::TVOn,
                    13
                }, Appliance {
                    "Fan",
                    ApplianceType::Type::Rotate,
                    Icons::Fan,
                    6
                }, Appliance {
                    "Blinds",
                    ApplianceType::Type::Static,
                    Icons::None,
                    21
                }, Appliance {
                    "Spot Lights",
                    Icons::BulbOff,
                    Icons::BulbOn,
                    20
                }}
        }};


    QSharedPointer<QAbstractListModel> kitchen{new ApplianceModel{
            QList{Appliance {
                    "Lights",
                    Icons::BulbOff,
                    Icons::BulbOn,
                    16
                }, Appliance {
                    "Fan",
                    ApplianceType::Type::Rotate,
                    Icons::Fan,
                    12
                }, Appliance {
                    "Fridge",
                    ApplianceType::Type::Static,
                    Icons::None,
                    5
                }, Appliance {
                    "Microwave Oven",
                    ApplianceType::Type::Static,
                    Icons::None,
                    8
                }}
        }};

    QSharedPointer<QAbstractListModel> bathRoom{new ApplianceModel{
            QList{Appliance {
                    "Lights",
                    Icons::BulbOff,
                    Icons::BulbOn,
                    9
                }, Appliance {
                    "Exhaust Fan",
                    ApplianceType::Type::Rotate,
                    Icons::Fan,
                    10
                }, Appliance {
                    "Water Geyser",
                    ApplianceType::Type::Static,
                    Icons::None,
                    11
                }}
        }};

    QSharedPointer<QAbstractListModel> room2{new ApplianceModel{
            QList{Appliance {
                    "Wash Machine",
                    ApplianceType::Type::Static,
                    Icons::None,
                    15
                }, Appliance {
                    "Drier",
                    ApplianceType::Type::Static,
                    Icons::None,
                    18
                }, Appliance {
                    "Lights",
                    Icons::BulbOff,
                    Icons::BulbOn,
                    22
                }, Appliance {
                    "Fan",
                    ApplianceType::Type::Rotate,
                    Icons::Fan,
                    -1
                }}
        }};


    QSharedPointer<QAbstractListModel> room3{new ApplianceModel{
            QList{Appliance {
                    "Lights",
                    Icons::BulbOff,
                    Icons::BulbOn,
                    -1
                }, Appliance {
                    "Fan",
                    ApplianceType::Type::Rotate,
                    Icons::Fan,
                    -1
                }}
        }};

    QSharedPointer<QAbstractListModel> room4{new ApplianceModel{
            QList{Appliance {
                    "Fan",
                    ApplianceType::Type::Rotate,
                    Icons::Fan,
                    -1
                }, Appliance {
                    "Device 1",
                    ApplianceType::Type::Static,
                    Icons::None,
                    -1
                }, Appliance {
                    "Device 2",
                    ApplianceType::Type::Static,
                    Icons::None,
                    -1
                }, Appliance {
                    "Device 3",
                    ApplianceType::Type::Static,
                    Icons::None,
                    -1
                }}
        }};

    QSharedPointer<QAbstractListModel> room5{new ApplianceModel{
            QList{Appliance {
                    "Lights",
                    Icons::BulbOff,
                    Icons::BulbOn,
                    -1
                }, Appliance {
                    "Device 1",
                    ApplianceType::Type::Static,
                    Icons::None,
                    -1
                }}
        }};


    m_rooms << Room {"Living Room", livingRoom}
            << Room {"Bed Room", bedRoom}
            << Room {"Bathroom", bathRoom}
            << Room {"Kitchen", kitchen}
            << Room {"Room 2", room2}
            << Room {"Room 3", room3}
            << Room {"Room 4", room4}
            << Room {"Room 5", room5};
}

int RoomModel::rowCount(const QModelIndex &parent) const
{
    return m_rooms.size();
}

QVariant RoomModel::data(const QModelIndex &index, int role) const
{
    if (index.row() < 0 || index.row() > m_rooms.size())
        return QVariant();

    switch (role)
    {
    case Roles::Title: return QString(m_rooms[index.row()].title);
    case Roles::Model: return QVariant::fromValue(m_rooms[index.row()].applianceModel);
    }

    return QVariant();
}

QAbstractListModel *RoomModel::getApplianceModel(const int &index)
{
    return m_rooms[index].applianceModel.data();
}

QHash<int, QByteArray> RoomModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[Title] = "title";
    roles[Model] = "appModel";
    return roles;
}
