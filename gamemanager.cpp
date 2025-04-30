#include "GameManager.h"
#include <QTimer>
#include <QRandomGenerator>

GameManager::GameManager(QObject *parent)
    : QObject(parent), m_stage(1), m_timerSeconds(15)
{
}

int GameManager::stage() const { return m_stage; }
QStringList GameManager::blockTexts() const { return m_blockTexts; }
int GameManager::timerSeconds() const { return m_timerSeconds; }

void GameManager::startGame()
{
    m_stage = 1;
    setupStage();
    emit stageChanged();
}

void GameManager::setupStage()
{
    int totalBlocks = m_stage * m_stage; // 2x2, 3x3, 4x4, 5x5

    QString baseText = "한글";
    QString diffText = "한굴"; // 다른 글자

    m_blockTexts.clear();
    m_correctIndex = QRandomGenerator::global()->bounded(totalBlocks);

    for (int i = 0; i < totalBlocks; ++i) {
        if (i == m_correctIndex)
            m_blockTexts.append(diffText);
        else
            m_blockTexts.append(baseText);
    }

    // 타이머 시간 설정
    switch (m_stage) {
    case 1: m_timerSeconds = 15; break;
    case 2: m_timerSeconds = 12; break;
    case 3: m_timerSeconds = 10; break;
    case 4: m_timerSeconds = 8; break;
    default: m_timerSeconds = 8; break;
    }

    emit blockTextsChanged();
    emit timerSecondsChanged();
}

void GameManager::checkAnswer(int index)
{
    if (index == m_correctIndex) {
        nextStage();
    } else {
        emit gameFail();
    }
}

void GameManager::nextStage()
{
    if (m_stage >= 4) {
        emit gameSuccess();
        return;
    }

    ++m_stage;
    setupStage();
    emit stageChanged();
}
