#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>

class Backend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString currentPlanetId READ currentPlanetId NOTIFY currentPlanetIdChanged)
    Q_PROPERTY(QString currentAge READ currentAge NOTIFY currentAgeChanged)
    Q_PROPERTY(bool therapyRunning READ therapyRunning NOTIFY therapyRunningChanged)

public:
    explicit Backend(QObject *parent = nullptr);

    QString currentPlanetId() const {return m_currentPlanetId;}
    QString currentAge() const {return m_currentAge;}
    bool therapyRunning() const {return m_therapyRunning;}

    Q_INVOKABLE void selectPlanet(const QString& planetId);
    Q_INVOKABLE void selectAge(const QString& age);
    Q_INVOKABLE void startHealing();
    Q_INVOKABLE void stopHealing();

signals:
    void currentPlanetIdChanged();
    void currentAgeChanged();
    void therapyRunningChanged();

private:
    QString m_currentPlanetId{"Venus"};
    QString m_currentAge{"Adult"};
    bool m_therapyRunning{false};
};

#endif // BACKEND_H
