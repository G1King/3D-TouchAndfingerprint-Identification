//
//  Student.h
//  GoBang
//
//  Created by Sobf Leo on 16/8/25.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject<NSCoding>
@property (nonatomic,copy) NSString * age;
+(void)stuJava;
+(void)stuOC;
@end
