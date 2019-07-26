//
//  CMRouteViewController.m
//  smallRoute
//
//  Created by HeQin on 2019/7/25.
//  Copyright © 2019 HeQin. All rights reserved.
//

#import "CMRouteViewController.h"
#import "RouteManager.h"

@interface CMRouteViewController ()

@end

@implementation CMRouteViewController
// 要实现这个方法，否则无法接受参数
+(instancetype)createdRouteVCWithParams:(NSDictionary *)params {
    CMRouteViewController *route = [[CMRouteViewController alloc] init];
    NSLog(@"%@",params);
    return route;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.routeCallback) {
        self.routeCallback(@"回调");
    }
    [[RouteManager shared] popViewControllerAnimated:YES];
}
@end
