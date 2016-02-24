//
//  ViewController.m
//  显示星星个数
//
//  Created by 谢小御 on 16/1/21.
//  Copyright © 2016年 谢小御. All rights reserved.
//

#import "ViewController.h"
#import "StarView.h"

@interface ViewController ()
@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) StarView *star;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.star = [[StarView alloc] initWithFrame:CGRectMake(50, 50, 250, 50)];
    //self.star.showStar = 0 * 20;
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(50, 150, 200, 50)];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    button.frame = CGRectMake(270, 150, 50, 50);
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.textField];
    self.textField.placeholder = @"请输入0.0-5.0的数字";
    [self.view addSubview:button];
    
    
}
- (void)buttonAction:(UIButton *)sender
{
    self.star = [[StarView alloc] initWithFrame:CGRectMake(50, 50, 250, 50)];
    self.star.showStar = [self.textField.text floatValue] * 20;
    
    [self.view addSubview:self.star];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
