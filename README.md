# smallRoute
根据类名字符串实现页面跳转

## 提供导航控制器
[RouteManager shared].navigationController = navi;

## 没有参数跳转
[[RouteManager shared] pushViewController:@"CMRouteViewController" animated:YES];

## 有参数跳转
[[RouteManager shared] pushViewController:@"CMRouteViewController" animated:YES params:dict];
  
## 有回调跳转
[[RouteManager shared] pushViewController:@"CMRouteViewController" animated:YES params:dict callback:^(id  _Nonnull customValue) {
        NSLog(@"%@",customValue);
    }];
## 接收参数
+(instancetype)createdRouteVCWithParams:(NSDictionary *)params {
    CMRouteViewController *route = [[CMRouteViewController alloc] init];
    NSLog(@"%@",params);
    return route;
}

## 回调
if (self.routeCallback) {
        self.routeCallback(@"回调");
}
## 返回
[[RouteManager shared] popViewControllerAnimated:YES];
