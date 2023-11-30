#include <jni.h>
#include <string>
#include "CPHMediaCommon.h"
#include "CPHMediaEngine.h"
#include <android/log.h>

extern "C"
JNIEXPORT jstring JNICALL
Java_com_chinamobile_cphsdk2demo_cphlibs_JniEntrance_stringFromJNI(JNIEnv *env, jobject thiz) {
    std::string hello = "Hello from C++";
    return env->NewStringUTF(hello.c_str());
}
extern "C"
JNIEXPORT jint JNICALL
Java_com_chinamobile_cphsdk2demo_cphlibs_JniEntrance_InjectTouchData(JNIEnv *env, jobject thiz, jobject operationInputDataObj) {
    jclass operationInputDataClass = env->GetObjectClass(operationInputDataObj);

    jfieldID orientationField = env->GetFieldID(operationInputDataClass, "orientation", "I");
    jint orientationValue = env->GetIntField(operationInputDataObj, orientationField);
    uint8_t cppOrientation = static_cast<uint8_t>(orientationValue);
    jfieldID reservedField = env->GetFieldID(operationInputDataClass, "reserved", "I");
    jint reservedValue = env->GetIntField(operationInputDataObj, reservedField);
    uint16_t cppReserved = static_cast<uint16_t>(reservedValue);
    jfieldID inputTypeField = env->GetFieldID(operationInputDataClass, "inputType", "I");
    jint inputTypeValue = env->GetIntField(operationInputDataObj, inputTypeField);
    uint16_t cppInputType = static_cast<uint16_t>(inputTypeValue);
    jfieldID physicalWidthField = env->GetFieldID(operationInputDataClass, "physicalWidth", "I");
    jint physicalWidthValue = env->GetIntField(operationInputDataObj, physicalWidthField);
    uint16_t cppPhysicalWidth = static_cast<uint16_t>(physicalWidthValue);
    jfieldID physicalHeightField = env->GetFieldID(operationInputDataClass, "physicalHeight", "I");
    jint physicalHeightValue = env->GetIntField(operationInputDataObj, physicalHeightField);
    uint16_t cppPhysicalHeight = static_cast<uint16_t>(physicalHeightValue);

    jfieldID inputDataField = env->GetFieldID(operationInputDataClass, "inputData",
                                              "Lcom/chinamobile/cphsdk2demo/cphlibs/bean/CphBean$OperationInputData$CPHTouchEvent;");
    _jobject *inputDataValue = env->GetObjectField(operationInputDataObj, inputDataField);
    jclass inputDataClass = env->GetObjectClass(inputDataValue);

    jfieldID xField = env->GetFieldID(inputDataClass, "x", "I");
    jint xValue = env->GetIntField(inputDataValue, xField);
    uint16_t cppX = static_cast<uint16_t>(xValue);
    jfieldID yField = env->GetFieldID(inputDataClass, "y", "I");
    jint yValue = env->GetIntField(inputDataValue, yField);
    uint16_t cppY = static_cast<uint16_t>(yValue);
    jfieldID pressureField = env->GetFieldID(inputDataClass, "pressure", "I");
    jint pressureValue = env->GetIntField(inputDataValue, pressureField);
    uint16_t cppPressure = static_cast<uint16_t>(pressureValue);
    jfieldID actionField = env->GetFieldID(inputDataClass, "action", "I");
    jint actionValue = env->GetIntField(inputDataValue, actionField);
    uint8_t cppAction = static_cast<uint8_t>(actionValue);
    jfieldID pointerIDField = env->GetFieldID(inputDataClass, "pointerID", "I");
    jint pointerIDValue = env->GetIntField(inputDataValue, pointerIDField);
    uint8_t cppPointerID = static_cast<uint8_t>(pointerIDValue);

    //调用方法
    CPHMediaEngine cphMediaEngine;
    CPHTouchEvent cphTouchEvent;
    OperationInputData operationInputData;
    cphTouchEvent.pointerID = cppPointerID;
    cphTouchEvent.action = cppAction;
    cphTouchEvent.x = cppX;
    cphTouchEvent.y = cppY;
    cphTouchEvent.pressure = cppPressure;
    operationInputData.orientation = cppOrientation;
    operationInputData.physicalWidth = cppPhysicalWidth;
    operationInputData.physicalHeight = cppPhysicalHeight;
    operationInputData.inputData = cphTouchEvent;
    int ret = cphMediaEngine.InjectTouchData(operationInputData);
    return ret;
}
extern "C"
JNIEXPORT jint JNICALL
Java_com_chinamobile_cphsdk2demo_cphlibs_JniEntrance_InjectKeyData(JNIEnv *env, jobject thiz,
                                                                   jobject cphKeyInputDataObj) {
    jclass cphKeyInputDataClass = env->GetObjectClass(cphKeyInputDataObj);

    jfieldID keyCodeField = env->GetFieldID(cphKeyInputDataClass, "keyCode", "I");
    jint keyCodeValue = env->GetIntField(cphKeyInputDataObj, keyCodeField);
    uint16_t cppkeyCode = static_cast<uint16_t>(keyCodeValue);
    jfieldID actionField = env->GetFieldID(cphKeyInputDataClass, "action", "I");
    jint actionValue = env->GetIntField(cphKeyInputDataObj, actionField);
    uint16_t cppAction = static_cast<uint16_t>(actionValue);

    CPHKeyInputData inputKey;
    CPHMediaEngine cphMediaEngine;
    inputKey.keyCode = cppkeyCode;
    inputKey.action = cppAction;
    int ret = cphMediaEngine.InjectKeyData(inputKey); // 音量加键按下
    return ret;
}

static void TestAudioCallback(uint8_t* buffer, uint32_t length, AudioCallbackExt &audioCallBackExt) {
    __android_log_print(ANDROID_LOG_INFO, "CphDemo", "audio_Datasize = %d", length);
    __android_log_print(ANDROID_LOG_INFO, "CphDemo", "frameTime is : %lld",
                        audioCallBackExt.timestamp);
}

extern "C"
JNIEXPORT jint JNICALL
Java_com_chinamobile_cphsdk2demo_cphlibs_JniEntrance_InitAudio(JNIEnv *env, jobject thiz,
                                                               jobject audioConfigParamsObj) {
    jclass audioConfigParamsClass = env->GetObjectClass(audioConfigParamsObj);

    jfieldID audioTypeField = env->GetFieldID(audioConfigParamsClass, "audioType", "I");
    jint audioTypeValue = env->GetIntField(audioConfigParamsObj, audioTypeField);
    AudioType cppAudioType = static_cast<AudioType>(audioTypeValue);
    jfieldID sampleIntervalField = env->GetFieldID(audioConfigParamsClass, "sampleInterval", "I");
    jint sampleIntervalValue = env->GetIntField(audioConfigParamsObj, sampleIntervalField);
    uint32_t cppSampleInterval = static_cast<uint32_t>(sampleIntervalValue);
    jfieldID sampleRateField = env->GetFieldID(audioConfigParamsClass, "sampleRate", "I");
    jint sampleRateValue = env->GetIntField(audioConfigParamsObj, sampleRateField);
    uint32_t cppSampleRate = static_cast<uint32_t>(sampleRateValue);

    AudioConfigParams audioConfigParams;
    CPHMediaEngine cphMediaEngine;
    audioConfigParams.audioType = cppAudioType;
    audioConfigParams.sampleInterval = cppSampleInterval;
    audioConfigParams.sampleRate = cppSampleRate;
    int ret = cphMediaEngine.InitAudio(audioConfigParams,TestAudioCallback);
    return ret;

}
extern "C"
JNIEXPORT jint JNICALL
Java_com_chinamobile_cphsdk2demo_cphlibs_JniEntrance_StartAudio(JNIEnv *env, jobject thiz) {
    CPHMediaEngine cphMediaEngine;
    return cphMediaEngine.StartAudio();
}
extern "C"
JNIEXPORT jint JNICALL
Java_com_chinamobile_cphsdk2demo_cphlibs_JniEntrance_StopAudio(JNIEnv *env, jobject thiz) {
    CPHMediaEngine cphMediaEngine;
    return cphMediaEngine.StopAudio();
}
extern "C"
JNIEXPORT jint JNICALL
Java_com_chinamobile_cphsdk2demo_cphlibs_JniEntrance_DestroyAudio(JNIEnv *env, jobject thiz) {
    CPHMediaEngine cphMediaEngine;
    return cphMediaEngine.DestroyAudio();
}
extern "C"
JNIEXPORT jobject JNICALL
Java_com_chinamobile_cphsdk2demo_cphlibs_JniEntrance_GetAudioStatus(JNIEnv *env, jobject thiz) {
    jclass mediaStatusClass = env->FindClass(
            "com/chinamobile/cphsdk2demo/cphlibs/bean/CphBean$MediaStatus");
    jfieldID invalidField = env->GetStaticFieldID(mediaStatusClass, "INVALID",
                                                  "Lcom/chinamobile/cphsdk2demo/cphlibs/bean/CphBean$MediaStatus;");
    jfieldID initField = env->GetStaticFieldID(mediaStatusClass, "INIT",
                                               "Lcom/chinamobile/cphsdk2demo/cphlibs/bean/CphBean$MediaStatus;");
    jfieldID runningField = env->GetStaticFieldID(mediaStatusClass, "RUNNING",
                                                  "Lcom/chinamobile/cphsdk2demo/cphlibs/bean/CphBean$MediaStatus;");
    jfieldID stoppedField = env->GetStaticFieldID(mediaStatusClass, "STOPPED",
                                                  "Lcom/chinamobile/cphsdk2demo/cphlibs/bean/CphBean$MediaStatus;");

    jobject invalidValue = env->GetStaticObjectField(mediaStatusClass, invalidField);
    jobject initValue = env->GetStaticObjectField(mediaStatusClass, initField);
    jobject runningValue = env->GetStaticObjectField(mediaStatusClass, runningField);
    jobject stoppedValue = env->GetStaticObjectField(mediaStatusClass, stoppedField);

    CPHMediaEngine cphMediaEngine;
    MediaStatus mediaStatus = cphMediaEngine.GetAudioStatus();

    if (mediaStatus == INVALID){
        return invalidValue;
    } else if (mediaStatus == INIT){
        return initValue;
    } else if (mediaStatus == RUNNING){
        return runningValue;
    } else if (mediaStatus == STOPPED){
        return stoppedValue;
    }

    return invalidValue;
}
extern "C"
JNIEXPORT jint JNICALL
Java_com_chinamobile_cphsdk2demo_cphlibs_JniEntrance_SetAudioParams(JNIEnv *env, jobject thiz,
                                                                    jobject audioParamsObj) {
    jclass audioParamsClass = env->GetObjectClass(audioParamsObj);

    jfieldID sampleIntervalField = env->GetFieldID(audioParamsClass, "sampleInterval", "I");
    jint sampleIntervalValue = env->GetIntField(audioParamsObj, sampleIntervalField);
    uint32_t cppSampleInterval = static_cast<uint32_t>(sampleIntervalValue);
    jfieldID bitrateField = env->GetFieldID(audioParamsClass, "bitrate", "I");
    jint bitrateValue = env->GetIntField(audioParamsObj, bitrateField);
    AudioType cppBitrate = static_cast<AudioType>(bitrateValue);

    AudioParams  audioParams;
    audioParams.sampleInterval = cppSampleInterval;
    audioParams.bitrate = cppBitrate;
    CPHMediaEngine cphMediaEngine;
    return cphMediaEngine.SetAudioParams(audioParams);
}

static void TestVideoCallback(uint8_t* buffer, uint32_t length, VideoCallbackExt &videoCallbackExt)
{
    __android_log_print(ANDROID_LOG_INFO, "CphDemo", "video_Datasize = ");
}

extern "C"
JNIEXPORT jint JNICALL
Java_com_chinamobile_cphsdk2demo_cphlibs_JniEntrance_InitVideo(JNIEnv *env, jobject thiz,
                                                               jobject videoConfigParamsObj) {
    jclass videoConfigParamsClass = env->GetObjectClass(videoConfigParamsObj);

    jfieldID physicalResolutionField = env->GetFieldID(videoConfigParamsClass, "physicalResolution",
                                                   "Lcom/chinamobile/cphsdk2demo/cphlibs/bean/CphBean$VideoConfigParams$FrameSize;");
    _jobject *physicalResolutionValue = env->GetObjectField(videoConfigParamsObj, physicalResolutionField);
    jclass physicalResolutionClass = env->GetObjectClass(physicalResolutionValue);

    jfieldID widthPhysicalResolutionField = env->GetFieldID(physicalResolutionClass, "width", "I");
    jint widthPhysicalResolutionValue = env->GetIntField(physicalResolutionValue, widthPhysicalResolutionField);
    uint16_t cppWidthPhysicalResolution = static_cast<uint16_t>(widthPhysicalResolutionValue);
    jfieldID heightPhysicalResolutionField = env->GetFieldID(physicalResolutionClass, "height", "I");
    jint heightPhysicalResolutionValue = env->GetIntField(physicalResolutionValue, heightPhysicalResolutionField);
    uint16_t cppHeightPhysicalResolution = static_cast<uint16_t>(heightPhysicalResolutionValue);

    FrameSize physicalResolution;
    physicalResolution.width = cppWidthPhysicalResolution;
    physicalResolution.height = cppHeightPhysicalResolution;

    VideoConfigParams videoConfigParams;
    videoConfigParams.physicalResolution = physicalResolution;

    CPHMediaEngine cphMediaEngine;
    int ret = cphMediaEngine.InitVideo(videoConfigParams,TestVideoCallback);
    return ret;
}