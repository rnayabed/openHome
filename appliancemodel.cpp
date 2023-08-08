#include "appliancemodel.h"

#include <QHash>
#include "icons.h"
#include "switchcontroller.h"

ApplianceModel::ApplianceModel(const QList<Appliance> &appliances)
    : m_appliances{appliances}
{}

int ApplianceModel::rowCount(const QModelIndex &parent) const
{
    return m_appliances.size();
}

QVariant ApplianceModel::data(const QModelIndex &index, int role) const
{
    if (index.row() < 0 || index.row() > m_appliances.size())
        return QVariant();

    switch (role)
    {
    case Roles::Title:      return QString(m_appliances[index.row()].title);
    case Roles::Type:       return QVariant(m_appliances[index.row()].type);
    case Roles::StaticIcon: return QString(Icons::get(m_appliances[index.row()].staticIcon));
    case Roles::OnIcon:     return QString(Icons::get(m_appliances[index.row()].onIcon));
    case Roles::OffIcon:    return QString(Icons::get(m_appliances[index.row()].offIcon));
    case Roles::Status:     return m_appliances[index.row()].status;
    }

    return QVariant();
}

QHash<int, QByteArray> ApplianceModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[Title] = "title";
    roles[Type] = "type";
    roles[StaticIcon] = "staticIcon";
    roles[OnIcon] = "onIcon";
    roles[OffIcon] = "offIcon";
    roles[Status] = "status";
    return roles;
}

void ApplianceModel::toggleAppliance(const int &index)
{
    m_appliances[index].toggle();
    if (m_appliances[index].pin > -1)
        SwitchController::instance().setStatus(m_appliances[index].pin, m_appliances[index].status);
    emit dataChanged(this->index(index), this->index(index));
}
