#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (SuccessAndFailure)
+ (MBProgressHUD *)spinner:(NSString *)title inView:(UIView *)view;
+ (MBProgressHUD *)toast:(NSString *)message nearTop:(BOOL)nearTop inView:(UIView *)view;
- (void)displaySuccess:(NSString *)message;
- (void)displayFailure:(NSString *)message;
@end
