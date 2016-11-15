//
//  GB.h
//  GoBang
//
//  Created by Sobf GlKing on 16/8/18.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#ifndef GB_h
#define GB_h

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define RGB_A(r,g,b,a) [UIColor colorWithRed:r green:g blue:b alpha:a]


#define DISPATH_ONECE  static dispatch_once_t onceToken;  \
dispatch_once(&onceToken, ^{        \
    self.backgroundColor = RGB_A(200/255.0, 160/255.0, 130/255.0 , 1);\
    [self addGestureRecognizer:tgr]; \
});
#pragma mark -- 快速单利
#undef    X_SINGLETON_DEC
#define X_SINGLETON_DEC( __class ) \
+ (__class *)sharedInstance;

#undef    X_SINGLETON_DEF
#define X_SINGLETON_DEF( __class ) \
+ (__class *)sharedInstance \
{ \
static dispatch_once_t once; \
static __class * __singleton__; \
dispatch_once( &once, ^{ __singleton__ = [[__class alloc] init]; } ); \
return __singleton__; \
}




#pragma mark -- log

#ifdef DEBUG
#define GlLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define GlLog(...)

#endif

#endif /* GB_h */
