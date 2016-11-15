//
//  ViewController.m
//  GoBang
//
//  Created by Sobf GlKing on 16/8/17.
//  Copyright © 2016年 SOBF. All rights reserved.
//

#import "ViewController.h"
#import "TempViewController.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "Student.h"
#import "ScrollViewController.h"
#define GL_LOCK(semaphore,a) semaphore = dispatch_semaphore_create(a)
#define GLWAIT dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
#define GLSIGNAL dispatch_semaphore_signal(semaphore)
@interface ViewController ()<UIViewControllerPreviewingDelegate>
@property (nonatomic,strong) UIView * showView;
 @property (nonatomic,strong) UIView * newView;
@end

@implementation ViewController
- (UIView *)newView{
    if (!_newView) {
        _newView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
        _newView.backgroundColor = [UIColor greenColor];
    }
    return _newView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"position"];
//    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 100)];
//    animation.duration = 2.0;
    
    
    
    
#pragma mark - 3D touch 内部的应用  轻按label 弹出peek 此时 向上话 可以看到 一些快捷选项   继续用力会弹到 TempVC 里
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(200, 300, 70, 70)];
    label.backgroundColor = [UIColor cyanColor];
    label.userInteractionEnabled = YES;
    
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        // 判断 机器是否支持 3D touch 
        [self registerForPreviewingWithDelegate:self sourceView:label];// 为label 添加peek

    }
    
    [self.view addSubview:label];
}
#pragma mark -UIViewControllerPreviewingDelegate  -peek下
-(UIViewController*)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location{
    TempViewController * temo = [[TempViewController alloc]init];
    temo.preferredContentSize = CGSizeMake(0, 300);
//     CGRect rect = CGRectMake(20, 20, 320 - 40, 400 - 40 - 64*2);
    
    return temo;
}

#pragma mark - 继续用力 会跳到 TempVC
- (void)previewContext:(id<UIViewControllerPreviewing>)context commitViewController:(UIViewController*)vc
{
    [self showViewController:vc sender:self];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CASpringAnimation * animation = [CASpringAnimation animation];
    
    animation.keyPath = @"position.x";
    animation.damping = 5;
    animation.mass = 1;
    animation.initialVelocity = 0;
    animation.fromValue = [NSValue valueWithCGPoint:self.newView.layer.position];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 300)];
    animation.duration = animation.settlingDuration;
    animation.removedOnCompletion = NO;//?不好使
    [self.newView.layer addAnimation:animation forKey:animation.keyPath];
//    [self.navigationController pushViewController:[TempViewController new] animated:YES];
}
-(void)method1{
    CASpringAnimation * ani = [CASpringAnimation animation];
    ani.keyPath = @"position.x";
    ani.fromValue =@(self.showView.center.x);
    ani.toValue = @(self.showView.center.x+150);
    ani.mass = 1; //质量，影响图层运动时的弹簧惯性，质量越大，弹簧拉伸和压缩的幅度越大
//    ani.stiffness = 90; //刚度系数(劲度系数/弹性系数)，刚度系数越大，形变产生的力就越大，运动越快
    ani.damping = 5;//阻尼系数，阻止弹簧伸缩的系数，阻尼系数越大，停止越快 ani.initialVelocity = 5.f;//初始速率，动画视图的初始速度大小;速率为正数时，速度方向与运动方向一致，速率为负数时，速度方向与运动方向相反
    ani.duration = ani.settlingDuration;
    ani.initialVelocity = 0;
    ani.removedOnCompletion = NO;
    ani.fillMode = kCAFillModeForwards;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.showView.layer addAnimation:ani forKey:@"boundsAni"];
}
-(void)method2{
    NSLog(@"-----Objective-C--------");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
