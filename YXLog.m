//
//  YXNSLog.m
//
//  http://www.cnblogs.com/YouXianMing/
//
//  Copyright (c) 2014年 Y.X. All rights reserved.
//

#import "YXLog.h"

#ifndef GCDExecOnce
#define GCDExecOnce(block) \
{ \
static dispatch_once_t predicate = 0; \
dispatch_once(&predicate, block); \
}
#endif

#define DMDEBUG_DEFAULT_DATEFORMAT @"HH:mm:ss.SSS"

static NSDateFormatter* _DMLogDateFormatter = nil;

void ExtendNSLogInfo(const char *file, int lineNumber, const char *functionName, NSString *format, ...)
{
    // 获取时间格式
    GCDExecOnce(^{
        if (_DMLogDateFormatter == nil)
        {
            _DMLogDateFormatter = [[NSDateFormatter alloc] init];
            [_DMLogDateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
            [_DMLogDateFormatter setDateFormat:DMDEBUG_DEFAULT_DATEFORMAT];
        }
    });
 
#if TIME_STAMP
    // 获取当前时间戳
    const char *nowCString = \
        [[_DMLogDateFormatter stringFromDate:[NSDate date]] \
         cStringUsingEncoding:NSUTF8StringEncoding];
    
    // 处理format
    va_list ap;
    va_start (ap, format);
    if (![format hasSuffix: @"\n"])
    {
        format = [format stringByAppendingString: @"\n"];
    }
    NSString *body = [[NSString alloc] initWithFormat:format arguments:ap];
    va_end (ap);
    
    // 获取一些参数
    NSString *fileName = [[NSString stringWithUTF8String:file] lastPathComponent];
    
    // 打印
    fprintf(stderr, "[INFO] %s %s:%d %s",
            nowCString,
            [fileName UTF8String],
            lineNumber,
            [body UTF8String]);
#else
    // 处理format
    va_list ap;
    va_start (ap, format);
    if (![format hasSuffix: @"\n"])
    {
        format = [format stringByAppendingString: @"\n"];
    }
    NSString *body = [[NSString alloc] initWithFormat:format arguments:ap];
    va_end (ap);
    
    // 获取一些参数
    NSString *fileName = [[NSString stringWithUTF8String:file] lastPathComponent];
    
    // 打印
    fprintf(stderr, "[INFO] %s:%d %s",
            [fileName UTF8String],
            lineNumber,
            [body UTF8String]);
#endif
}

void ExtendNSLogDebug(const char *file, int lineNumber, const char *functionName, NSString *format, ...)
{
    // 获取时间格式
    GCDExecOnce(^{
        if (_DMLogDateFormatter == nil)
        {
            _DMLogDateFormatter = [[NSDateFormatter alloc] init];
            [_DMLogDateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
            [_DMLogDateFormatter setDateFormat:DMDEBUG_DEFAULT_DATEFORMAT];
        }
    });
    
#if TIME_STAMP
    // 获取当前时间戳
    const char *nowCString = \
    [[_DMLogDateFormatter stringFromDate:[NSDate date]] \
     cStringUsingEncoding:NSUTF8StringEncoding];
    
    // 处理format
    va_list ap;
    va_start (ap, format);
    if (![format hasSuffix: @"\n"])
    {
        format = [format stringByAppendingString: @"\n"];
    }
    NSString *body = [[NSString alloc] initWithFormat:format arguments:ap];
    va_end (ap);
    
    // 获取一些参数
    NSString *fileName = [[NSString stringWithUTF8String:file] lastPathComponent];
    
    // 打印
    fprintf(stderr, "[DEBUG] %s %s:%d %s",
            nowCString,
            [fileName UTF8String],
            lineNumber,
            [body UTF8String]);
#else
    // 处理format
    va_list ap;
    va_start (ap, format);
    if (![format hasSuffix: @"\n"])
    {
        format = [format stringByAppendingString: @"\n"];
    }
    NSString *body = [[NSString alloc] initWithFormat:format arguments:ap];
    va_end (ap);
    
    // 获取一些参数
    NSString *fileName = [[NSString stringWithUTF8String:file] lastPathComponent];
    
    // 打印
    fprintf(stderr, "[DEBUG] %s:%d %s",
            [fileName UTF8String],
            lineNumber,
            [body UTF8String]);
#endif
}


void ExtendNSLogWarning(const char *file, int lineNumber, const char *functionName, NSString *format, ...)
{
    // 获取时间格式
    GCDExecOnce(^{
        if (_DMLogDateFormatter == nil)
        {
            _DMLogDateFormatter = [[NSDateFormatter alloc] init];
            [_DMLogDateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
            [_DMLogDateFormatter setDateFormat:DMDEBUG_DEFAULT_DATEFORMAT];
        }
    });
    
#if TIME_STAMP
    // 获取当前时间戳
    const char *nowCString = \
    [[_DMLogDateFormatter stringFromDate:[NSDate date]] \
     cStringUsingEncoding:NSUTF8StringEncoding];
    
    // 处理format
    va_list ap;
    va_start (ap, format);
    if (![format hasSuffix: @"\n"])
    {
        format = [format stringByAppendingString: @"\n"];
    }
    NSString *body = [[NSString alloc] initWithFormat:format arguments:ap];
    va_end (ap);
    
    // 获取一些参数
    NSString *fileName = [[NSString stringWithUTF8String:file] lastPathComponent];
    
    // 打印
    fprintf(stderr, "[WARNING] %s %s:%d %s",
            nowCString,
            [fileName UTF8String],
            lineNumber,
            [body UTF8String]);
#else
    // 处理format
    va_list ap;
    va_start (ap, format);
    if (![format hasSuffix: @"\n"])
    {
        format = [format stringByAppendingString: @"\n"];
    }
    NSString *body = [[NSString alloc] initWithFormat:format arguments:ap];
    va_end (ap);
    
    // 获取一些参数
    NSString *fileName = [[NSString stringWithUTF8String:file] lastPathComponent];
    
    // 打印
    fprintf(stderr, "[WARNING] %s:%d %s",
            [fileName UTF8String],
            lineNumber,
            [body UTF8String]);
#endif
}

void ExtendNSLogError(const char *file, int lineNumber, const char *functionName, NSString *format, ...)
{
    // 获取时间格式
    GCDExecOnce(^{
        if (_DMLogDateFormatter == nil)
        {
            _DMLogDateFormatter = [[NSDateFormatter alloc] init];
            [_DMLogDateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
            [_DMLogDateFormatter setDateFormat:DMDEBUG_DEFAULT_DATEFORMAT];
        }
    });
    
#if TIME_STAMP
    // 获取当前时间戳
    const char *nowCString = \
    [[_DMLogDateFormatter stringFromDate:[NSDate date]] \
     cStringUsingEncoding:NSUTF8StringEncoding];
    
    // 处理format
    va_list ap;
    va_start (ap, format);
    if (![format hasSuffix: @"\n"])
    {
        format = [format stringByAppendingString: @"\n"];
    }
    NSString *body = [[NSString alloc] initWithFormat:format arguments:ap];
    va_end (ap);
    
    // 获取一些参数
    NSString *fileName = [[NSString stringWithUTF8String:file] lastPathComponent];
    
    // 打印
    fprintf(stderr, "[ERROR] %s %s:%d %s",
            nowCString,
            [fileName UTF8String],
            lineNumber,
            [body UTF8String]);
#else
    // 处理format
    va_list ap;
    va_start (ap, format);
    if (![format hasSuffix: @"\n"])
    {
        format = [format stringByAppendingString: @"\n"];
    }
    NSString *body = [[NSString alloc] initWithFormat:format arguments:ap];
    va_end (ap);
    
    // 获取一些参数
    NSString *fileName = [[NSString stringWithUTF8String:file] lastPathComponent];
    
    // 打印
    fprintf(stderr, "[ERROR] %s:%d %s",
            [fileName UTF8String],
            lineNumber,
            [body UTF8String]);
#endif
}

void ExtendNSLogTrace(const char *file, int lineNumber, const char *functionName, NSString *format, ...)
{
    // 获取时间格式
    GCDExecOnce(^{
        if (_DMLogDateFormatter == nil)
        {
            _DMLogDateFormatter = [[NSDateFormatter alloc] init];
            [_DMLogDateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"]];
            [_DMLogDateFormatter setDateFormat:DMDEBUG_DEFAULT_DATEFORMAT];
        }
    });
    
#if TIME_STAMP
    // 获取当前时间戳
    const char *nowCString = \
    [[_DMLogDateFormatter stringFromDate:[NSDate date]] \
     cStringUsingEncoding:NSUTF8StringEncoding];
    
    // 处理format
    va_list ap;
    va_start (ap, format);
    if (![format hasSuffix: @"\n"])
    {
        format = [format stringByAppendingString: @"\n"];
    }
    NSString *body = [[NSString alloc] initWithFormat:format arguments:ap];
    va_end (ap);
    
    // 获取一些参数
    NSString *fileName = [[NSString stringWithUTF8String:file] lastPathComponent];
    
    // 打印
    fprintf(stderr, "[TRACE] %s %s:%d %s",
            nowCString,
            [fileName UTF8String],
            lineNumber,
            [body UTF8String]);
#else
    // 处理format
    va_list ap;
    va_start (ap, format);
    if (![format hasSuffix: @"\n"])
    {
        format = [format stringByAppendingString: @"\n"];
    }
    NSString *body = [[NSString alloc] initWithFormat:format arguments:ap];
    va_end (ap);
    
    // 获取一些参数
    NSString *fileName = [[NSString stringWithUTF8String:file] lastPathComponent];
    
    // 打印
    fprintf(stderr, "[TRACE] %s:%d %s",
            [fileName UTF8String],
            lineNumber,
            [body UTF8String]);
#endif
}