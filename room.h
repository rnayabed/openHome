#ifndef ROOM_H
#define ROOM_H

#include <QString>
#include <QSharedPointer>
#include <QAbstractListModel>

struct Room
{
    QString title;
    QSharedPointer<QAbstractListModel> applianceModel;
};

#endif // ROOM_H
