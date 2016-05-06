//
//  ViewController.m
//  JZTProgressView
//
//  Created by 朱小亮 on 16/4/11.
//  Copyright © 2016年 zhusven. All rights reserved.
//

#import "ViewController.h"
#import "XXProgressView.h"

@interface ViewController ()
{
    XXProgressView *_xx;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    CGRect frame = self.view.frame;
//    frame.size.height -=200;
//    _xx = [[XXProgressView alloc] initWithFrame:frame];
//    
//    [self.view addSubview:_xx];
  
}

- (IBAction)action:(id)sender{
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(change) userInfo:nil repeats:YES];
}

- (void)change{
    _xx.percentVaue +=0.01;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
