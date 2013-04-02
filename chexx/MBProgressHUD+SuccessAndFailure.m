#import "MBProgressHUD+SuccessAndFailure.h"

@implementation MBProgressHUD (SuccessAndFailure)
+ (MBProgressHUD *)spinner:(NSString *)title inView:(UIView *)view {
  // Avoid placing ourself in a scroll view, where we could be scrolled away from.
  if ([view isKindOfClass:[UIScrollView class]]) {
    view = view.superview;
  }
  MBProgressHUD *modalHUD = [[MBProgressHUD alloc] initWithView:view];
  modalHUD.square = YES;
	[view addSubview:modalHUD];

  modalHUD.removeFromSuperViewOnHide = YES;
  modalHUD.labelText = title;
  modalHUD.dimBackground = YES;
  [modalHUD show:YES];
  return modalHUD;
}

+ (MBProgressHUD *)toast:(NSString *)message nearTop:(BOOL)nearTop inView:(UIView *)view {
  // Avoid placing ourself in a scroll view, where we could be scrolled away from.
  if ([view isKindOfClass:[UIScrollView class]]) {
    view = view.superview;
  }
  MBProgressHUD *modalHUD = [[MBProgressHUD alloc] initWithView:view];
  modalHUD.customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
  modalHUD.mode = MBProgressHUDModeCustomView;
  modalHUD.userInteractionEnabled = NO;
  // Position the toast a little higher than we normally would
  if (nearTop) {
    modalHUD.yOffset = view.bounds.size.height * -0.35;
  } else {
    modalHUD.yOffset = view.bounds.size.height * 0.35;
  }
  modalHUD.margin = 15;
  modalHUD.opacity = 0.3;
	[view addSubview:modalHUD];
  modalHUD.removeFromSuperViewOnHide = YES;
  NSRange newline = [message rangeOfString:@"\n"];
  if (newline.location != NSNotFound) {
    NSString *firstPart = [message substringToIndex:newline.location];
    modalHUD.labelText = firstPart;
    modalHUD.labelFont = [modalHUD.labelFont fontWithSize:15];
    if ((newline.location + 1) < message.length) {
      NSString *rest = [message substringFromIndex:newline.location + 1];
      modalHUD.detailsLabelFont = modalHUD.labelFont;
      modalHUD.detailsLabelText = rest;
    }
  } else {
    modalHUD.labelText = message;
  }
  [modalHUD show:YES];
  modalHUD.frame = CGRectMake(0, 0, modalHUD.frame.size.width, modalHUD.frame.size.height);
  return modalHUD;
}

- (void)displaySuccess:(NSString *)message {
  self.labelText = message;
  self.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chexx-success"]];
  self.mode = MBProgressHUDModeCustomView;
  [self hide:YES afterDelay:1.5];
}

- (void)displayFailure:(NSString *)message {
  self.labelText = message;
  self.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chexx-failure"]];
  self.mode = MBProgressHUDModeCustomView;
  [self hide:YES afterDelay:2.5];
}
@end
