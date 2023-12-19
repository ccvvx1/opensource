#include <iostream>
#include <dlfcn.h>

// 定义一个函数指针类型
typedef void (*MyFunctionType)();

extern "C"
JNIEXPORT jint  JNICALL
Java_com_chinamobile_cphsdk2demo_thirdpartylibs_JniThirdPartyEntrance_testSo(JNIEnv *env,
                                                                             jobject thiz) {
    system("cp /storage/emulated/0/Android/data/com.chinamobile.cphsdk2demo/files/libexample.so /data/data/com.chinamobile.cphsdk2demo/");
    system("cp /storage/emulated/0/Android/data/com.chinamobile.cphsdk2demo/files/testDex.dex /data/data/com.chinamobile.cphsdk2demo/");
    // 加载外部SO库
    void* libraryHandle = dlopen("/data/data/com.chinamobile.cphsdk2demo/libexample.so", RTLD_LAZY);

    if (!libraryHandle) {
        LOGI("Error loading library: %s", dlerror());
        return 1;
    }

    // 获取函数地址
    MyFunctionType myFunction = (MyFunctionType)dlsym(libraryHandle, "myFunction");

    if (!myFunction) {
        LOGI("Error loading function: %s", dlerror());
        dlclose(libraryHandle);
        return 1;
    }

    // 调用函数
    myFunction();

    // 卸载SO库
    dlclose(libraryHandle);

    return 0;
}