/*
 * 版权所有 (c) 华为技术有限公司
 * 功能说明：CPH media engine 接口
 */
#ifndef CPH_MEDIA_ENGINE_H
#define CPH_MEDIA_ENGINE_H

#include <cstdint>
#include "CPHMediaCommon.h"

/**
 * @功能描述：视频数据回调函数
 * @参数：   uint8_t* 数据
 *          unit32_t 数据长度
 *          VideoCallbackExt 扩展回调参数
 */
using  VideoCallback = void(*)(uint8_t*, uint32_t, VideoCallbackExt&);

/**
 * @功能描述：音频数据回调函数
 * @参数：   uint8_t* 数据
 *          unit32_t 数据长度
 *          AudioCallbackExt 扩展回调参数
 */
using AudioCallback = void(*)(uint8_t *, uint32_t, AudioCallbackExt &);

/**
 * @功能描述：硬件仿真回调函数
 * @参数：   uint8_t* 数据
 *          unit32_t 数据长度
 *          VmiDeviceCallbackExt 扩展回调参数
 */
using VmiDeviceCallback = void(*)(uint8_t*, uint32_t, VmiDeviceCallbackExt&);

class CPHMediaEngine {
public:
    /**
     * @功能描述：构造函数
     */
    CPHMediaEngine();

    /**
     * @功能描述：析构函数
     */
    ~CPHMediaEngine();

    /**
   * @功能描述：版本号获取
   * @返回值：版本号
   */
    const char* GetVersion();

    /**
     * @功能描述：视频初始化
     * @参数：VideoConfigParams 视频配置参数
     *        VideoCallback     视频回调函数
     * @返回值：0成功 -1失败
     */
    int InitVideo(VideoConfigParams& params, VideoCallback callback);

    /**
     * @功能描述：视频初始化-兼容音视频1.0版本,仅用于过渡期，后续会删除
     * @参数：VideoConfigParams 视频配置参数
     *        VideoCallback     视频回调函数
     *        bool     是否强制横屏(兼容1.0场景)
     * @返回值：0成功 -1失败
     */
    int InitVideo(VideoConfigParams& params, VideoCallback callback, bool isForceLandscape);

    /**
     * @功能描述：视频初始化
     * @参数：jsonConfig        json格式的视频配置参数
     *        VideoCallback     视频回调函数
     *        bool     是否强制横屏
     * @返回值：0成功 -1失败
     */
    int InitVideo(const char* jsonConfig, VideoCallback callback, bool isForceLandscape);

    /**
     * @功能描述：视频启动
     * @返回值：0成功 -1失败
     */
    int StartVideo();

    /**
     * @功能描述：视频停止
     * @返回值：0成功 -1失败
     */
    int StopVideo();

    /**
     * @功能描述：视频销毁
     * @返回值：0成功 -1失败
     */
    int DestroyVideo();

    /**
     * @功能描述：视频状态获取
     * @返回值：视频状态
     */
    MediaStatus GetVideoStatus();

    /**
     * @功能描述：视频参数获取
     * @返回值：视频参数
     */
    VideoParams& GetVideoParams();

    /**
     * @功能描述：视频参数设置
     * @返回值：0成功 -1失败
     */
    int SetVideoParams(VideoParams& videoParams);

    /**
     * @功能描述：视频参数设置，json字符串，只需提供需要修改的字段
     * @返回值：0成功 -1失败
     */
    int SetParams(const char* jsonConfig);

    /**
     * @功能描述: 传入yuv数据直接编码H264
     * @参数[in]: yuvFrame yuv抓图数据
     * @返回值: @返回值：0成功 -1失败
     */
    int InjectYuvData(CaptureYuvFrame& yuvFrame);

    /**
     * @功能描述：强制产生I帧
     * @返回值：0成功 -1失败
     */
    int GenerateKeyFrame();

    /**
     * @功能描述: 通过设置默认参数，初始化音频服务
     * @参数[in]: AudioConfigParams& params: 音频初始化参数
     *           AudioCallback callback: 音频数据回调函数
     * @返回值: 0: 成功;
     *         -1: 音频服务初始化失败
     */
    int InitAudio(AudioConfigParams& params, AudioCallback callback);

    /**
     * @功能描述: 启动音频服务，获取音频数据
     * @返回值: 0: 成功;
     *         -1: 启动音频服务失败
     */
    int StartAudio();

    /**
     * @功能描述: 停止音频服务，停止音频数据的获取
     * @返回值: 0: 成功;
     *         -1: 停止音频服务失败
     */
    int StopAudio();

    /*
     * @功能描述: 销毁音频服务
     * @返回值: 0: 成功
     *         -1: 销毁音频服务失败
     */
    int DestroyAudio();

    /*
     * @功能描述: 获取音频服务状态
     * @返回值: MediaStatus::INVALID 无效
     *         MediaStatus::INIT 初始化
     *         MediaStatus::RUNNING 运行中
     *         MediaStatus::STOPPED 已停止
     */
    MediaStatus GetAudioStatus();

    /**
     * @功能描述：音频参数设置
     * @返回值：0成功 -1失败
     */
    int SetAudioParams(AudioParams& audioParams);

    /*
     * @功能描述：服务端接收操控数据处理(有客户端配套)
     * @参数 [in] buf:接收的操控数据的内存指针
     * @参数 [in] length:接收的操控数据长度
     * @返回值：0成功，-1数据处理失败
     */
    int InjectTouchData(void *buf, unsigned long length);

    /*
     * @功能描述：服务端接收操控数据处理(无客户端配套)
     * @参数 [in] OperationInputData:操控数据结构体
     * @返回值：0成功，-1数据处理失败
     */
    int InjectTouchData(OperationInputData &operationInputData);

	/*
	 * @功能描述：服务端接收按键操控数据处理(有客户端配套)
	 * @参数 [in] buf:接收的操控数据的内存指针
	 * @参数 [in] length:接收的操控数据长度
	 * @返回值：0成功，-1数据处理失败
	 */
	int InjectKeyData(void *buf, unsigned long length);

	/*
	 * @功能描述：服务端接收手柄操控数据处理(有客户端配套)
	 * @参数 [in] buf:接收的操控数据的内存指针
	 * @参数 [in] length:接收的操控数据长度
	 * @返回值：0成功，-1数据处理失败
	 */
	int InjectAxisData(void *buf, unsigned long length);

    /*
	 * @功能描述：服务端接收按键操控数据处理(无客户端配套)
	 * @参数 [in] keyInputData : 按键数据结构体
	 * @返回值：0成功，-1数据处理失败
	 */
    int InjectKeyData(CPHKeyInputData &keyInputData);

    /*
	 * @功能描述：服务端接收手柄操控数据处理(无客户端配套)
	 * @参数 [in] axisInputData : 手柄数据结构体
	 * @返回值：0成功，-1数据处理失败
	 */
    int InjectAxisData(CPHAxisInputData &axisInputData);

    /*
     * @功能描述：注销触控注入
     * @返回值：成功0，失败-1
     */
    int DestroyTouchInject();

    /**
     * @功能描述: 通过仿真硬件类型和初始化参数，初始化仿真硬件
     * @参数[in]: VmiDeviceType deviceType: 仿真硬件类型
     *           VmiConfigParams& params: 仿真硬件初始化参数
     *           VmiDeviceCallback callback: 仿真硬件回调函数
     * @返回值:  0: 成功;
     *         -1: 仿真硬件初始化失败;
     */
    int InitVmiDevice(VmiDeviceType deviceType, VmiConfigParams& params, VmiDeviceCallback callback);

    /**
     * @功能描述: 通过仿真硬件类型使能对应仿真硬件
     * @参数[in]: VmiDeviceType deviceType: 仿真硬件类型
     * @返回值:  0: 成功;
     *         -1: 仿真硬件使能失败;
     */
    int EnableVmiDevice(VmiDeviceType deviceType);

    /**
     * @功能描述: 通过仿真硬件类型禁用对应仿真硬件
     * @参数[in]: VmiDeviceType deviceType: 仿真硬件类型
     * @返回值:  0: 成功;
     *         -1: 仿真硬件禁用失败;
     */
    int DisableVmiDevice(VmiDeviceType deviceType);

    /*
     * @功能描述: 通过仿真硬件类型销毁对应仿真硬件
     * @参数[in]: VmiDeviceType deviceType: 仿真硬件类型
     * @返回值:  0: 成功
     *         -1: 仿真硬件销毁失败
     */
    int DestroyVmiDevice(VmiDeviceType deviceType);

    /*
     * @功能描述: 数据注入到仿真硬件
     * @参数[in]: VmiDeviceType deviceType: 仿真硬件类型
     *            uint8_t* data；注入的数据
     *            uint32_t len：数据长度
     * @返回值:  0: 成功
     *         -1: 仿真硬件数据注入失败
     */
    int VmiDeviceSend(VmiDeviceType deviceType, uint8_t* data, uint32_t len);

    /*
     * @功能描述: 通过仿真硬件类型获取对应仿真硬件状态
     * @参数[in]: VmiDeviceType deviceType: 仿真硬件类型
     * @返回值: VMI_INVALID 无效
     *         VMI_INIT 初始化
     *         VMI_ENABLED 使能
     *         VMI_DISABLED 禁止
     */
    VmiDeviceStatus GetVmiDeviceStatus(VmiDeviceType deviceType);

    /*
     * @功能描述: 获取当前支持的出帧类型
     * @返回值: json串 例如：{"videoFrameType":"RGB|YUV|H264|H265"}
     */
    const char* GetSupportedVideoFrameType();
};
#endif