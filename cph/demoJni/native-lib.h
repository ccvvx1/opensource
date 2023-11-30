#ifndef CLOUDAPPENGINE_CAEENGINCONTROL_H
#define CLOUDAPPENGINE_CAEENGINCONTROL_H

#include <fstream>

class CphEngineControl {
public:
    CphEngineControl();

    ~CphEngineControl();

    static CphEngineControl &GetInstance();

    int Init();

    CPHMediaEngine *m_cphMediaEngine;
    std::mutex m_initLock;
};

#endif