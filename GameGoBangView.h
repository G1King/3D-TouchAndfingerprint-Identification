//
//  GameGoBangView.h
//  GoBang
//
//  Created by Sobf GlKing on 16/8/17.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameGoBangView : UIView
/**
 *  新游戏,重新开始新的一句
 */
-(void)newGame;
/**
 *  返回上一步棋
 *
 *  @param sender 棋子
 */
-(void)backOneStep:(UIButton *)sender;
/**
 *  选高级的棋谱
 */
-(void)changeGameLevel;
@end
