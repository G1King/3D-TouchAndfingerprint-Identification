//
//  Student.m
//  GoBang
//
//  Created by Sobf Leo on 16/8/25.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import "Student.h"
#import <objc/runtime.h>
@implementation Student
+(void)stuOC{
    NSLog(@"======Objective-C======");
}
+(void)stuJava{
    NSLog(@"======Java=====");
}
- (void)encodeWithCoder:(NSCoder *)coder
{

    
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
@end
