//
//  ViewController.m
//  AnimationTest
//
//  Created by 丁玉松 on 15/4/29.
//  Copyright (c) 2015年 丁玉松. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [button setTitle:@"开始动画" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    button.frame = CGRectMake(0, 20, 100, 45);
    
    [self.view addSubview:button];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)btnClick:(UIButton *)button
{
//    [self animationOfUIKit];
    
//    [self animationOfBlock];
    
//    [self animationOfCABasicAnimation];
    
//    [self animationOfCAKeyframeAnimationPath];
    
    
    [self animationOfCAKeyframeAnimationPath2];
    
}


-(void)animationOfCABasicAnimation
{
    //创建一个CABasicAnimation对象
    CABasicAnimation *animation=[CABasicAnimation animation];
    //设置颜色
    animation.toValue=(id)[UIColor blueColor].CGColor;
    //动画时间
    animation.duration=1;
    //是否反转变为原来的属性值
    animation.autoreverses=YES;
    //把animation添加到图层的layer中，便可以播放动画了。forKey指定要应用此动画的属性
    [self.view.layer addAnimation:animation forKey:@"backgroundColor"];
    
}


-(void)animationOfBlock
{
    //初始化一个View，用来显示动画
    UIView *redView=[[UIView alloc]initWithFrame:CGRectMake(10, 10, 100, 100)];
    redView.backgroundColor=[UIColor redColor];
    
    [self.view addSubview:redView];
    
    [UIView animateWithDuration:1 //时长
                          delay:0 //延迟时间
                        options:UIViewAnimationOptionTransitionFlipFromLeft//动画效果
                     animations:^{
                         
                         //动画设置区域
                         redView.backgroundColor=[UIColor blueColor];
                         redView.frame=CGRectMake(50, 50, 200, 200);
                         redView.alpha=0.5;
                         
                     } completion:^(BOOL finish){
                         //动画结束时调用
                         //............
                     }];
    
    
}

-(void)animationOfUIKit
{
    UIView *redView=[[UIView alloc]initWithFrame:CGRectMake(10, 10, 100, 100)];
    redView.backgroundColor=[UIColor redColor];
    
    [self.view addSubview:redView];
    //开始动画
    [UIView beginAnimations:@"test" context:nil];
    //动画时长
    [UIView setAnimationDuration:1];
    /*
     *要进行动画设置的地方
     */
    
    redView.backgroundColor=[UIColor blueColor];
    redView.frame=CGRectMake(50, 50, 200, 200);
    redView.alpha=0.5;
    
    
    //动画结束
    [UIView commitAnimations];
}

-(void)animationOfCAKeyframeAnimationPath
{
    //初始化一个View，用来显示动画
    UIView *redView=[[UIView alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
    redView.backgroundColor=[UIColor redColor];
    
    [self.view addSubview:redView];
    
    CAKeyframeAnimation *ani=[CAKeyframeAnimation animation];
    //初始化路径
    CGMutablePathRef aPath=CGPathCreateMutable();
    //动画起始点
    CGPathMoveToPoint(aPath, nil, 20, 20);
    CGPathAddCurveToPoint(aPath, nil,
                          160, 30,//控制点
                          220, 220,//控制点
                          24, 38);//控制点
    
    ani.path=aPath;
    ani.duration=10;
    //设置为渐出
    ani.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    //自动旋转方向
    ani.rotationMode=@"auto";
    
    [redView.layer addAnimation:ani forKey:@"position"];
}

-(void)animationOfCAKeyframeAnimationPath1
{
    UIView *redView=[[UIView alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
    redView.backgroundColor=[UIColor redColor];
    [self.view addSubview:redView];
    
    
    
    
    CGMutablePathRef path = CGPathCreateMutable();
    //将路径的起点定位到（50  120）
    CGPathMoveToPoint(path,NULL,50.0,120.0);
    //下面5行添加5条直线的路径到path中
    CGPathAddLineToPoint(path,NULL, 60, 130);
    CGPathAddLineToPoint(path,NULL, 70, 140);
    CGPathAddLineToPoint(path,NULL, 80, 150);
    CGPathAddLineToPoint(path,NULL, 90, 160);
    CGPathAddLineToPoint(path,NULL, 100, 170);
    //下面四行添加四条曲线路径到path
    CGPathAddCurveToPoint(path,NULL,50.0,275.0,150.0,275.0,70.0,120.0);
    CGPathAddCurveToPoint(path,NULL,150.0,275.0,250.0,275.0,90.0,120.0);
    CGPathAddCurveToPoint(path,NULL,250.0,275.0,350.0,275.0,110.0,120.0);
    CGPathAddCurveToPoint(path,NULL,350.0,275.0,450.0,275.0,130.0,120.0);
    //以“position”为关键字创建 实例
    CAKeyframeAnimation    *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //设置path属性
    [animation     setPath:path];
    [animation     setDuration:3.0];
    //这句代码    表示 是否动画回到原位
    //[animation setAutoreverses:YES];    CFRelease(path);
    
    [redView.layer     addAnimation:animation forKey:NULL];
    
}

-(void)animationOfCAKeyframeAnimationPath2
{
    
    UIView *redView=[[UIView alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
    redView.backgroundColor=[UIColor redColor];
    [self.view addSubview:redView];

    CGPoint
    p1=CGPointMake(50, 120);
    CGPoint
    p2=CGPointMake(80, 170);
    CGPoint
    p3=CGPointMake(30, 100);
    CGPoint
    p4=CGPointMake(100, 190);
    CGPoint
    p5=CGPointMake(200, 10);
    NSArray
    *values=[NSArray arrayWithObjects:[NSValue valueWithCGPoint:p1],[NSValue valueWithCGPoint:p2],[NSValue valueWithCGPoint:p3],[NSValue valueWithCGPoint:p4],[NSValue valueWithCGPoint:p5], nil];
    CAKeyframeAnimation
    *animation
    = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [animation setValues:values];
    [animation
     setDuration:3.0];
    [animation
     setAutoreverses:YES];
    [redView.layer
     addAnimation:animation forKey:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
