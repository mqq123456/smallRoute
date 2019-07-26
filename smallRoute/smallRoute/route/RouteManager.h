//
//  RouteManager.h
//  smallRoute
//
//  Created by HeQin on 2019/7/26.
//  Copyright © 2019 HeQin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
typedef void (^RouteCallBlock)(id customValue);
@interface RouteManager : NSObject

+(RouteManager *)shared;
// 一定要现给导航控制器，否则，不会发生跳转
@property (nonatomic, strong) UINavigationController *navigationController;

- (void)pushViewController:(NSString *)viewController animated:(BOOL)animated;

- (UIViewController *)popViewControllerAnimated:(BOOL)animated;

- (void)presentViewController:(NSString *)viewControllerToPresent animated: (BOOL)flag completion:(void (^ __nullable)(void))completion ;

- (void)dismissViewControllerAnimated: (BOOL)flag completion: (void (^ __nullable)(void))completion;

- (void)pushViewController:(NSString *)viewController animated:(BOOL)animated params:(NSDictionary *_Nullable)params;

- (void)presentViewController:(NSString *)viewControllerToPresent animated: (BOOL)flag completion:(void (^ __nullable)(void))completion params:(NSDictionary * _Nullable)params;

- (void)pushViewController:(NSString *)viewController animated:(BOOL)animated params:(NSDictionary *_Nullable)params callback:(__nullable RouteCallBlock)block;

- (void)presentViewController:(NSString *)viewControllerToPresent animated: (BOOL)flag completion:(void (^ __nullable)(void))completion params:( NSDictionary * _Nullable )params callback:(__nullable RouteCallBlock)block;

@end
@interface UIViewController (RouteManager)

/**
 *  创建vc
 *
 *  @param params 传过去的参数
 *
 *  @return 返回初始化vc
 */
+(instancetype)createdRouteVCWithParams:(NSDictionary *)params;

@property(nonatomic,copy)RouteCallBlock routeCallback;
@end
NS_ASSUME_NONNULL_END
