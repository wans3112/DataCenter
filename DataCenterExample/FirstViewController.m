//
//  FirstViewController.m
//  DataCenterExample
//
//  Created by wans on 2017/5/10.
//  Copyright © 2017年 wans. All rights reserved.
//

#import "FirstViewController.h"
#import "BFDataCenterTest.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [BFDataCenterTest test];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
