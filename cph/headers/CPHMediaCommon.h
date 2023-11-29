#ifndef CPH_MEDIA_COMMON_H
#define CPH_MEDIA_COMMON_H

//音视频服务状态
enum MediaStatus {
    INVALID,
    INIT,
    RUNNING,
    STOPPED
};

//视频帧类型
enum VideoFrameType {
    H264,
    YUV,    //I420
    RGB,    //RGBA8888
    H265,
    FRAME_TYPE_MAX
};

//编码模式
enum RCMode {
    ABR,    //平均码率
    CRF,    //画质优先
    CBR,     //恒定码率
    CAPPED_CRF,
    RC_MODE_MAX
};

//编码类型
enum EncoderType {
    DEFAULT,
    CPU,
    GPU,
    ENCODE_TYPE_MAX
};

//编码级别
enum ProfileType {
    BASELINE,
    MAIN,
    HIGH
};

//分辨率
struct FrameSize {
    uint32_t width = 720;
    uint32_t height = 1280;
};

//视频配置参数
struct VideoConfigParams {
    EncoderType encoderType = DEFAULT;          //编码器类型
    uint32_t channel = 0;                   //硬编码通道
    VideoFrameType videoFrameType = H264;   //视频格式
    uint32_t frameRate	= 30;               //帧率
    uint32_t bitrate = 3000000;             //码率
    uint32_t gopSize = 3000;                //I帧间隔
    ProfileType profile = MAIN;             //编码复杂度
    RCMode rcMode = ABR;                    //流控模式
    FrameSize physicalResolution;           //云手机物理分辨率
    FrameSize virtualResolution;            //图片采集分辨率（不高于物理分辨率）
};

//视频时延统计扩展参数
struct VideoLatencyExt {
    uint64_t startCaptureTimestamp;
    uint64_t endCaptureTimestamp;
    uint64_t startEncodeTimestamp;
    uint64_t endEncodeTimestamp;
};

//视频扩展回调参数
struct VideoCallbackExt {
    uint64_t timestamp;     //当前帧的时间戳
    uint8_t orientation;
    VideoLatencyExt videoLatencyExt;
    uint32_t refreshRate;
};

//视频动态参数
struct VideoParams {
    VideoFrameType videoFrameType = H264;   //视频格式，不支持动态
    uint32_t frameRate	= 30;               //帧率，编码参数，静止画面补帧有效
    uint32_t bitrate = 3000000;             //码率
    uint32_t gopSize = 3000;                //I帧间隔
    ProfileType profile = MAIN;             //编码复杂度
    RCMode rcMode = ABR;                    //流控模式
    FrameSize virtualResolution;            //图片采集分辨率（不高于物理分辨率）
};

//yuv抓图数据
struct CaptureYuvFrame{
    uint8_t *yuvBuf;
    uint32_t yuvBufSize;
    uint8_t orientation;
    uint32_t width;
    uint32_t height;
};

//音频类型
enum AudioType {
    OPUS,
    PCM
};

// 音频配置参数
struct AudioConfigParams {
    AudioType audioType = OPUS;
    uint32_t sampleRate = 48 * 1000; //只有在OPUS格式有效,不支持修改
    uint32_t sampleInterval = 10; //ms，只有在OPUS格式有效
};

//音频扩展回调参数
struct AudioCallbackExt {
    uint8_t channels = 2;                   // 声道数 1：MONO/2:STEREO(默认)
    uint8_t audioBitDepth = 16;             // 采样深度 8bit/16bit(默认)
    uint32_t sampleRate = 48000;            // 采样率 44100Hz/48000Hz(默认)，只有在OPUS格式有效
    uint32_t sampleInterval = 10;           // 采样间隔 10ms(默认)/20ms，只有在OPUS格式有效
    uint64_t timestamp;                     // 音频数据时间戳 毫秒，UTC时间
};

//音频配置参数
struct AudioParams {
    uint32_t sampleInterval = 10;           //ms，只有在OPUS格式有效
    uint32_t bitrate = 192000;              //bps，只有在OPUS格式有效
};



// 触控协议
enum InputType : uint8_t {
    typeA,
    typeB
};

// 触控事件
struct CPHTouchEvent {
    uint8_t pointerID;
    uint8_t action;
    uint16_t x;
    uint16_t y;
    uint16_t pressure;
} __attribute__((packed));

// 触控传输数据
struct OperationInputData {
    uint8_t orientation;
    InputType inputType;
    uint16_t reserved;
    uint16_t physicalWidth;
    uint16_t physicalHeight;
    CPHTouchEvent inputData;
} __attribute__((packed));

// 键盘输入数据
struct CPHKeyInputData {
    uint16_t keyCode;
    uint16_t action;
} __attribute__((packed));

// 摇杆输入数据
struct CPHAxisInputData {
    uint16_t masterAxis;
    uint16_t secondaryAxis;
    int32_t masterValue;
    int32_t secondaryValue;
} __attribute__((packed));

// 仿真硬件状态
enum VmiDeviceStatus {
    VMI_INVALID,
    VMI_INIT,
    VMI_ENABLED,
    VMI_DISABLED
};

// 仿真硬件类型
enum VmiDeviceType {
    CAMERA, //摄像头
    MICROPHONE, //麦克风
    SENSOR, //传感器
    DEVICE_MAX
};

// 仿真硬件支持的数据类型
enum DataType {
    VMI_H264,
    VMI_JPEG,
    VMI_I420
};

// 仿真硬件初始化配置
struct VmiConfigParams {
    DataType dataType = VMI_H264;
    uint32_t reserved1 = 0;
    uint32_t reserved2 = 0;
    uint32_t reserved3 = 0;
};

// 仿真硬件扩展回调参数
struct VmiDeviceCallbackExt {
    uint64_t timestamp = 0;
    VmiDeviceType deviceType = CAMERA;
    uint32_t reserved1 = 0;
    uint32_t reserved2 = 0;
    uint32_t reserved3 = 0;
};

#endif//CPH_MEDIA_COMMON_H