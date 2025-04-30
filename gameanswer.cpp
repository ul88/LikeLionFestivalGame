#include "gameanswer.h"

GameAnswer::GameAnswer() : m_stage(1) {
    answerList.append(qMakePair("일기\n예보", "일가\n예보"));
    answerList.append(qMakePair("훈민\n정음", "휸민\n정음"));
    answerList.append(qMakePair("동네","동내"));
    answerList.append(qMakePair("세종\n대왕","새종\n대왕"));
    answerList.append(qMakePair("바른\n말고\n운말","바른\n말모\n운말"));
    answerList.append(qMakePair("대한\n민국\n만세","대한\n민국\n만새"));
    answerList.append(qMakePair("철쭉","철쪽"));
    answerList.append(qMakePair("재촉","쟤촉"));
    answerList.append(qMakePair("한국","한굮"));
    answerList.append(qMakePair("서울","서올"));
    answerList.append(qMakePair("공항","공황"));
    answerList.append(qMakePair("인공\n지능","인궁\n지능"));
    answerList.append(qMakePair("인공\n지능\n기술","인궁\n지능\n기술"));
    answerList.append(qMakePair("멋쟁\n이호\n랑이","멋쟹\n이호\n랑이"));
}

void GameAnswer::start(){
    nowList.clear();
    setStage(m_stage+1);

    do{
        m_randAns = QRandomGenerator::global()->bounded(0, answerList.size());
    }while(s.contains(m_randAns));
    s.insert(m_randAns);
    int randPos = QRandomGenerator::global()->bounded(0, m_stage*m_stage);
    for(int i=0;i<m_stage*m_stage;i++){
        if(i == randPos){
            nowList.append(answerList[m_randAns].second);
        }else{
            nowList.append(answerList[m_randAns].first);
        }
    }
}

QString GameAnswer::getAnswer(){
    return answerList[m_randAns].second;
}

int GameAnswer::getHeight(){
    switch(m_stage){
    case 2:
        return 200;
    case 3:
        return 130;
    case 4:
        return 95;
    case 5:
        return 74;
    }
    return 0;
}

int GameAnswer::getWidth(){
    switch(m_stage){
    case 2:
        return 200;
    case 3:
        return 130;
    case 4:
        return 95;
    case 5:
        return 74;
    }
    return 0;
}

void GameAnswer::reset(){
    setStage(1);
    s.clear();
}
