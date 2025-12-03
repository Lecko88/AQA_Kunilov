#include "backend.h"
#include <QDebug>

Backend::Backend(QObject *parent)
    : QObject{parent}
{}

void Backend::selectPlanet(const QString &planetId)
{
    if(planetId == m_currentPlanetId) return;

    m_currentPlanetId = planetId;
    qDebug() << "Current planet is set to " << m_currentPlanetId;

    /*
     * Here must be the code to notify underlying model, if neccessary...
     * */

    emit currentPlanetIdChanged();
}

void Backend::selectAge(const QString &age)
{
    if(age == m_currentAge) return;

    m_currentAge = age;
    qDebug() << "Current age is set to " << m_currentAge;

    /*
     * Here must be the code to notify underlying model, if neccessary...
     * */

    emit currentAgeChanged();
}

void Backend::startHealing()
{
    qDebug() << "Healing started with planet " << m_currentPlanetId <<"; age " << m_currentAge;
    /*
     * Here we send signal to the underlying model. On real medical device
     * the model should confirm, that therapy was really started. Only in
     * this case we change flag and send signal back to GUI
     * In the assignment I assume that everything is fine
     * */
    if(true) //here is the flag that everything is ok
    {
        m_therapyRunning = true;
        emit therapyRunningChanged();
    }
}

void Backend::stopHealing()
{
    qDebug() << "Healing stopped with planet " << m_currentPlanetId <<"; age " << m_currentAge;
    /*
     * Here we send signal to the underlying model. On real medical device
     * the model should confirm, that therapy was really stopped. Only in
     * this case we change flag and send signal back to GUI
     * In the assignment I assume that everything is fine
     * */
    if(true) //here is the flag that everything is ok
    {
        m_therapyRunning = false;
        emit therapyRunningChanged();
    }
}
