//
//  XXProgressView.m
//  JZTProgressView
//
//  Created by 朱小亮 on 16/4/11.
//  Copyright © 2016年 zhusven. All rights reserved.
//

#import "XXProgressView.h"
@interface XXProgressView()
@property (strong, nonatomic) CAShapeLayer *baseCircleLayer;
@property (strong, nonatomic) CAShapeLayer *percentCircleLayer;

@end


static const CGFloat kStartAngle = M_PI*3/4;
static const CGFloat kEndAngle = M_PI_4;

@implementation XXProgressView


- (id)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
  
        [self addBaseCircleLayer];
        [self addPercentCircleLayer];
    }
    return self;
}

//kStartAngle 到 kEndAngle的UIBezierPath 的弧长为1

- (void)addBaseCircleLayer{
    self.baseCircleLayer = [self circleLayerWithFrame:self.bounds position:self.center radius:self.bounds.size.width/2.5 startAngle:kStartAngle endAngle:kEndAngle lineWidth:10 strokeColor:[UIColor blueColor] fillColor:[UIColor clearColor]];
    [self.layer addSublayer:self.baseCircleLayer];
}

- (void)addPercentCircleLayer{

    CAShapeLayer *layer     = [self circleLayerWithFrame:self.bounds position:self.center radius:self.bounds.size.width/2.8 startAngle:kStartAngle endAngle:kEndAngle lineWidth:10 strokeColor:[UIColor redColor] fillColor:[UIColor clearColor]];
    self.percentCircleLayer = layer;
    [self.layer addSublayer:self.percentCircleLayer];
    //弧长定了 设置百分比
//    self.percentVaue = 0;
    self.percentCircleLayer.strokeEnd= 0;//或者用上面这个
}

- (CAShapeLayer *)circleLayerWithFrame:(CGRect )frame position:(CGPoint)position radius:(CGFloat)raidus startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle lineWidth:(CGFloat)lineWidth strokeColor:(UIColor *)strokeColor fillColor:(UIColor *)fillColor{
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame         = frame;
    UIBezierPath *path  = nil;
    path                = [UIBezierPath bezierPathWithArcCenter:position radius:raidus startAngle:startAngle endAngle:endAngle clockwise:YES];
    layer.lineWidth     = lineWidth;
    layer.path          = path.CGPath;
    layer.fillColor     = fillColor.CGColor;
    layer.strokeColor   = strokeColor.CGColor;
    layer.lineCap       = kCALineCapRound;
    return layer;
}

- (void)setPercentVaue:(CGFloat)percentVaue{
   
    _percentVaue = percentVaue;
 
    self.percentCircleLayer.strokeEnd = percentVaue;
  
    
}





@end
