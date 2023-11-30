package com.chinamobile.cphsdk2demo.cphlibs;

import com.chinamobile.cphsdk2demo.cphlibs.bean.CphBean;

public class JniEntrance {

    private static JniEntrance mInstance;

    static {
        System.loadLibrary("cphsdk2demo");
    }

    public static JniEntrance getInstance(){
        if (mInstance == null) {
            mInstance = new JniEntrance();
        }
        return mInstance;
    }

    public native String stringFromJNI();

    public native int InjectTouchData(CphBean.OperationInputData operationInputData);
    public native int InjectKeyData(CphBean.CPHKeyInputData cphKeyInputData);
    public native int InitAudio(CphBean.AudioConfigParams audioConfigParams);
    // 音频audio
    public native int StartAudio();
    public native int StopAudio();
    public native int DestroyAudio();
    public native CphBean.MediaStatus GetAudioStatus();
    public native int SetAudioParams(CphBean.AudioParams audioParams);
    // 视频video
    public native int InitVideo(CphBean.VideoConfigParams videoConfigParams);
}
