#ifndef ROOMMODEL_H
#define ROOMMODEL_H

#include <QAbstractListModel>
#include <QObject>
#include <QQmlEngine>

#include "room.h"
#include "appliancemodel.h"
#include "appliance.h"

class RoomModel : public QAbstractListModel
{
    Q_OBJECT
public:
    RoomModel();

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    Q_INVOKABLE QAbstractListModel* getApplianceModel(const int& index);
    QHash<int, QByteArray> roleNames() const override;

    enum Roles {
        Title = Qt::UserRole + 1,
        Type,
        StaticIcon,
        OnIcon,
        OffIcon
    };

private:
    QList<Room> m_rooms;
};

#endif // ROOMMODEL_H
