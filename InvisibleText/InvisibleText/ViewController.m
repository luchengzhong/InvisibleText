//
//  ViewController.m
//  InvisibleText
//
//  Created by 钟路成 on 16/6/13.
//  Copyright © 2016年 Lucheng Zhong. All rights reserved.
//

#import "ViewController.h"
#import "CoverView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CoverView *cv = [[CoverView alloc] initWithFrame:_invisibleTextFiled.frame];
    [self.view addSubview:cv];
    [self.view bringSubviewToFront:cv];
    // Do any additional setup after loading the view, typically from a nib.
    //_photo.layer.cornerRadius = 43;
    //_photo.layer.masksToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
