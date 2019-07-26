//
//  ViewController.m
//  smallRoute
//
//  Created by HeQin on 2019/7/25.
//  Copyright © 2019 HeQin. All rights reserved.
//

#import "ViewController.h"
#import "RouteManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSDictionary *dict = @{@"parms":@"test"};
//    // 没有参数跳转
//    [[RouteManager shared] pushViewController:@"CMRouteViewController" animated:YES];
//    // 有参数跳转
//    [[RouteManager shared] pushViewController:@"CMRouteViewController" animated:YES params:dict];
    // 有回调
    [[RouteManager shared] pushViewController:@"CMRouteViewController" animated:YES params:dict callback:^(id  _Nonnull customValue) {
        NSLog(@"%@",customValue);
    }];
    
    
}

@end
