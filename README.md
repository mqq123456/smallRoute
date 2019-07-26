# smallRoute
根据类名字符串实现页面跳转

## 没有参数跳转
[[RouteManager shared] pushViewController:@"CMRouteViewController" animated:YES];

## 有参数跳转
[[RouteManager shared] pushViewController:@"CMRouteViewController" animated:YES params:dict];
  
## 有回调跳转
[[RouteManager shared] pushViewController:@"CMRouteViewController" animated:YES params:dict callback:^(id  _Nonnull customValue) {
        NSLog(@"%@",customValue);
    }];
