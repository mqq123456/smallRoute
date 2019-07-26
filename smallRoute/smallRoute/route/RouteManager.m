//
//  RouteManager.m
//  smallRoute
//
//  Created by HeQin on 2019/7/26.
//  Copyright © 2019 HeQin. All rights reserved.
//

#import "RouteManager.h"
#import <objc/runtime.h>

static char routeCallBlockKey;
@implementation UIViewController (RouteManager)
@dynamic routeCallback;
+(instancetype)createdRouteVCWithParams:(NSDictionary *)params{
    return nil;
}
#pragma mark routeReCallBlock set&get
- (void)setRouteCallback:(RouteCallBlock)callback {
    objc_setAssociatedObject(self, &routeCallBlockKey, callback, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (RouteCallBlock)routeCallback {
    return objc_getAssociatedObject(self, &routeCallBlockKey);
}
@end
@implementation RouteManager
+ (RouteManager *)shared {
    static RouteManager *manager = nil;
    if (manager == nil) {
        manager = [[self alloc]init];
    }
    return manager;
}

- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}

- (void)pushViewController:(NSString *)viewController animated:(BOOL)animated {
    [self pushViewController:viewController animated:animated params:nil callback:nil];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    return [self.navigationController popViewControllerAnimated:YES];
}

- (void)presentViewController:(NSString *)viewControllerToPresent animated: (BOOL)flag completion:(void (^ __nullable)(void))completion  {
    [self presentViewController:viewControllerToPresent animated:flag completion:completion params:nil callback:nil];
}

- (void)dismissViewControllerAnimated: (BOOL)flag completion: (void (^ __nullable)(void))completion {
    return [self.navigationController dismissViewControllerAnimated:YES completion:completion];
}

- (void)pushViewController:(NSString *)viewController animated:(BOOL)animated params:(NSDictionary *_Nullable)params {
    [self pushViewController:viewController animated:animated params:params callback:nil];
}

- (void)presentViewController:(NSString *)viewControllerToPresent animated: (BOOL)flag completion:(void (^ __nullable)(void))completion params:(NSDictionary * _Nullable)params {
    [self presentViewController:viewControllerToPresent animated:flag completion:completion params:params callback:nil];
}

- (void)pushViewController:(NSString *)viewController animated:(BOOL)animated params:(NSDictionary *_Nullable)params callback:(__nullable RouteCallBlock)block {
    Class cass = nil;
    if (viewController) {
        cass = NSClassFromString(viewController);
    }
    UIViewController *vc = nil;
    if ([cass respondsToSelector:@selector(createdRouteVCWithParams:)]) {
        vc = [cass createdRouteVCWithParams:params];
    }else{
        vc = [[cass alloc] init];
    }
    [self.navigationController pushViewController:vc animated:animated];
    if (block) {
        vc.routeCallback = block;
    }
}

- (void)presentViewController:(NSString *)viewControllerToPresent animated: (BOOL)flag completion:(void (^ __nullable)(void))completion params:( NSDictionary * _Nullable )params callback:(__nullable RouteCallBlock)block {
    Class cass = nil;
    if (viewControllerToPresent) {
        cass = NSClassFromString(viewControllerToPresent);
    }
    UIViewController *vc = nil;
    if ([cass respondsToSelector:@selector(createdRouteVCWithParams:)]) {
        vc = [cass createdRouteVCWithParams:params];
    }
    [self.navigationController presentViewController:vc animated:flag completion:completion];
    if (block) {
        vc.routeCallback = block;
    }
}


@end
