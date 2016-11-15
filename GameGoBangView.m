//
//  GameGoBangView.m
//  GoBang
//
//  Created by Sobf GlKing on 16/8/17.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import "GameGoBangView.h"
#import <CoreGraphics/CoreGraphics.h>//画棋谱
#import "GB.h"


static const NSInteger KSpeceCount = 15;// 高级棋谱空格 15*15 初级棋谱 12*12
static const NSInteger KSpaceWidth = 20;
typedef NS_ENUM(NSInteger,GlKDirection){
    GlHorizontal=0,//水平方向
    GlVertical, // 垂直方向
    GlObliqueDown, //斜向下
    GlObliqueUp  // 斜向上
};//四个方向
 
@interface GameGoBangView ()
@property (nonatomic,assign) CGFloat gbWidth;// 棋谱的宽
@property (nonatomic,assign) NSInteger grandCount;
@property (nonatomic,assign) BOOL isBlack;//是否为黑棋子
@property (nonatomic,assign) BOOL isGameOver;// 游戏结束的判定
@property (nonatomic,assign) BOOL isHighLevel;//是否高级棋谱
@property (nonatomic,copy)   NSString * lastOneKey;
@property (nonatomic,strong) NSMutableArray * sameChesses;//相同颜色一样的棋子
@property (nonatomic,strong) NSMutableDictionary * chessesDic;

@end

@implementation GameGoBangView

-(instancetype)initWithFrame:(CGRect)frame{
   
    if (self = [super initWithFrame:frame]) {
        [self setFrame:frame];
    }
    
    return self;
}
-(void)setFrame:(CGRect)frame{
    CGSize size = frame.size;
    [super setFrame:CGRectMake(frame.origin.x, frame.origin.y, MIN(size.width, size.height), MIN(size.width, size.height))];
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    UITapGestureRecognizer * tgr = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    DISPATH_ONECE;
    
}
-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    CGFloat width = rect.size.width;
    self.gbWidth = (width-2*KSpaceWidth) / self.grandCount;
    
    UIGraphicsBeginImageContext(rect.size);
    
}
-(NSInteger)grandCount{
    
    return self.isHighLevel ? KSpeceCount : (KSpeceCount-4);
}
#pragma mark - 下棋
-(void)tap:(UITapGestureRecognizer*)tgr{
    
}
@end
