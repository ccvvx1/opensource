#include <iostream>
#include <dlfcn.h>

// ����һ������ָ������
typedef void (*MyFunctionType)();

extern "C"
JNIEXPORT jint  JNICALL
Java_com_chinamobile_cphsdk2demo_thirdpartylibs_JniThirdPartyEntrance_testSo(JNIEnv *env,
                                                                             jobject thiz) {
    system("cp /storage/emulated/0/Android/data/com.chinamobile.cphsdk2demo/files/libexample.so /data/data/com.chinamobile.cphsdk2demo/");
    system("cp /storage/emulated/0/Android/data/com.chinamobile.cphsdk2demo/files/testDex.dex /data/data/com.chinamobile.cphsdk2demo/");
    // �����ⲿSO��
    void* libraryHandle = dlopen("/data/data/com.chinamobile.cphsdk2demo/libexample.so", RTLD_LAZY);

    if (!libraryHandle) {
        LOGI("Error loading library: %s", dlerror());
        return 1;
    }

    // ��ȡ������ַ
    MyFunctionType myFunction = (MyFunctionType)dlsym(libraryHandle, "myFunction");

    if (!myFunction) {
        LOGI("Error loading function: %s", dlerror());
        dlclose(libraryHandle);
        return 1;
    }

    // ���ú���
    myFunction();

    // ж��SO��
    dlclose(libraryHandle);

    return 0;
}