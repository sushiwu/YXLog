# YXLog
---

###Use like this:
```
    NSLogInfo(@"YouXianMing");
    NSLogDebug(@"YouXianMing");
    NSLogWaring(@"YouXianMing");
    NSLogError(@"YouXianMing");
    NSLogTrace(@"YouXianMing");
    NSLog(@"YouXianMing");
```

###Config

```
// 各种模式的打印开关
#define LOG_INFO       ON
#define LOG_TRACE      ON
#define LOG_DEBUG      ON
#define LOG_WARNING    ON
#define LOG_ERROR      ON

// 是否显示时间戳
#define TIME_STAMP     ON

// 是否开启系统
#define LOG_NSLOG      ON
