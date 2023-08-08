#ifndef APPLIANCEMODEL_H
#define APPLIANCEMODEL_H

#include <QAbstractListModel>
#include <QObject>
#include <QQmlEngine>

#include "appliance.h"

class ApplianceModel : public QAbstractListModel
{
    Q_OBJECT
public:
    ApplianceModel(const QList<Appliance>& appliances);

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

    enum Roles {
        Title = Qt::UserRole + 1,
        Type,
        StaticIcon,
        OnIcon,
        OffIcon,
        Status
    };

public slots:
    void toggleAppliance(const int& index);

private:
    QList<Appliance> m_appliances;
};

#endif // APPLIANCEMODEL_H
