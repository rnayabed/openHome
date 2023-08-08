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
                    "Fan",
                    ApplianceType::Type::Rotate,
                    Icons::Fan,
                    4
                }}
        }};

    m_rooms << Room {"Bed Room", bedRoom};

    QSharedPointer<QAbstractListModel> livingRoom{new ApplianceModel{
            QList{Appliance {
                    "TV2",
                    Icons::TVOff,
                    Icons::TVOn,
                    5
                }}
        }};

    m_rooms << Room {"Living Room", livingRoom};

    QSharedPointer<QAbstractListModel> bathRoom{new ApplianceModel{
            QList{Appliance {
                    "Lights",
                    Icons::TVOff,
                    Icons::TVOn,
                    6
                }}
        }};

    m_rooms << Room {"Bathroom", bathRoom};
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
    return roles;
}
