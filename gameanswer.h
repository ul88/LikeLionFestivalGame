#ifndef GAMEANSWER_H
#define GAMEANSWER_H
#include<QQuickItem>
#include<QList>
#include<QString>
#include<QSet>
#include <QRandomGenerator>

class GameAnswer : public QQuickItem
{
    Q_OBJECT
    Q_PROPERTY(int stage READ stage WRITE setStage NOTIFY stageChanged FINAL)
    Q_PROPERTY(bool pass READ pass WRITE setPass NOTIFY passChanged FINAL)
signals:
    void stageChanged();
    void passChanged();
public slots:
    QString getData(int n){
        if(nowList.size() <= n) return "Error";
        return nowList[n];
    }
    void start();
    QString getAnswer();

    int getWidth();
    int getHeight();

    void reset();
public:
    GameAnswer();

    int stage() const {return m_stage;}
    void setStage(int stage) {
        m_stage = stage;
        emit stageChanged();
    }
    bool pass() const {return m_pass;}
    void setPass(bool pass){
        m_pass = pass;
        emit passChanged();
    }

private:
    QList<QPair<QString, QString>> answerList;
    QList<QString> nowList;
    QSet<int> s;
    int m_stage;
    int m_randAns;
    bool m_pass;
};

#endif // GAMEANSWER_H
