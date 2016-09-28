//
//  ViewController.m
//  KMTapCounter
//
//  Created by Student P_03 on 14/09/16.
//  Copyright © 2016 Karishma Mahajan. All rights reserved.
//

#define kHeightOfResetButton 80.0
#define kHeightOfStatusBar 20.0
#define kHeightToReduceFrom (kHeightOfResetButton + kHeightOfStatusBar)

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    CGFloat heightOfScreen = [[UIScreen mainScreen] bounds].size.height;
    
    CGFloat widthOfScreen = [[UIScreen mainScreen] bounds].size.width;
    CGRect labelNumberFrame = CGRectMake(0, kHeightOfStatusBar, widthOfScreen, heightOfScreen-kHeightToReduceFrom);
    labelNumber = [[UILabel alloc]initWithFrame:labelNumberFrame];
    labelNumber.backgroundColor = [UIColor whiteColor];
    labelNumber.textColor = [UIColor redColor];
  [self handleReset];
    
    labelNumber.textAlignment = NSTextAlignmentCenter;
    labelNumber.font = [UIFont systemFontOfSize:100];
    [self.view addSubview:labelNumber];
    
    
    buttonTap = [[UIButton alloc]initWithFrame:labelNumberFrame];
    [buttonTap addTarget:self action:@selector(handleTap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonTap];
    
    
    CGRect resetButtonFrame = CGRectMake(0, heightOfScreen-kHeightOfResetButton, widthOfScreen, kHeightOfResetButton);
    buttonReset = [[UIButton alloc]initWithFrame:resetButtonFrame];
    
    [buttonReset setTitle:@"RESET" forState:UIControlStateNormal];
    [buttonReset setTitle:@"RESETING..." forState:UIControlStateHighlighted];
    
    [buttonReset setTintColor:[UIColor whiteColor]];
    [buttonReset setBackgroundColor:[UIColor redColor]];
    
    [buttonReset addTarget:self action:@selector(handleReset) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:buttonReset];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)handleTap {
    
    NSString *currentValueString = labelNumber.text;
    
    int currentValueInt = currentValueString.intValue;
    
    currentValueInt = currentValueInt + 1;
    NSString *newValueString = [NSString stringWithFormat:@"%d",currentValueInt];
    
    labelNumber.text = newValueString;
    
    }



-(void)handleReset {
    labelNumber.text = @"0";
}



@end




