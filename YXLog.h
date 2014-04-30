//
//  YXNSLog.h
//
//  http://www.cnblogs.com/YouXianMing/
//
//  Copyright (c) 2014年 Y.X. All rights reserved.
//

#import "YXLogConfig.h"

#if LOG_INFO
#define NSLogInfo(args...) ExtendNSLogInfo(__FILE__,__LINE__,__PRETTY_FUNCTION__,args);
void ExtendNSLogInfo(const char *file, int lineNumber, const char *functionName, NSString *format, ...);
#else
#define NSLogInfo(args...)
#endif


#if LOG_DEBUG
#define NSLogDebug(args...) ExtendNSLogDebug(__FILE__,__LINE__,__PRETTY_FUNCTION__,args);
void ExtendNSLogDebug(const char *file, int lineNumber, const char *functionName, NSString *format, ...);
#else
#define NSLogDebug(args...)
#endif


#if LOG_WARNING
#define NSLogWaring(args...) ExtendNSLogWarning(__FILE__,__LINE__,__PRETTY_FUNCTION__,args);
void ExtendNSLogWarning(const char *file, int lineNumber, const char *functionName, NSString *format, ...);
#else
#define NSLogWaring(args...)
#endif


#if LOG_ERROR
#define NSLogError(args...) ExtendNSLogError(__FILE__,__LINE__,__PRETTY_FUNCTION__,args);
void ExtendNSLogError(const char *file, int lineNumber, const char *functionName, NSString *format, ...);
#else
#define NSLogError(args...)
#endif


#if LOG_TRACE
#define NSLogTrace(args...) ExtendNSLogTrace(__FILE__,__LINE__,__PRETTY_FUNCTION__,args);
void ExtendNSLogTrace(const char *file, int lineNumber, const char *functionName, NSString *format, ...);
#else
#define NSLogTrace(args...)
#endif


#if LOG_NSLOG
#else
#define NSLog(args...)
#endif
