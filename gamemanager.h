#pragma once

#include <QObject>
#include <QStringList>

class GameManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int stage READ stage NOTIFY stageChanged)
    Q_PROPERTY(QStringList blockTexts READ blockTexts NOTIFY blockTextsChanged)
    Q_PROPERTY(int timerSeconds READ timerSeconds NOTIFY timerSecondsChanged)

public:
    explicit GameManager(QObject *parent = nullptr);

    int stage() const;
    QStringList blockTexts() const;
    int timerSeconds() const;

    Q_INVOKABLE void checkAnswer(int index);
    Q_INVOKABLE void startGame();

signals:
    void stageChanged();
    void blockTextsChanged();
    void timerSecondsChanged();
    void gameSuccess();
    void gameFail();

private:
    void setupStage();
    void nextStage();

    int m_stage;
    QStringList m_blockTexts;
    int m_correctIndex;
    int m_timerSeconds;
};

