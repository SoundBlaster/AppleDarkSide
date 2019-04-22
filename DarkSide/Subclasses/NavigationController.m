#import "NavigationController.h"

@implementation NavigationController

-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    BOOL isDark = self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark;
    self.navigationBar.barStyle = isDark ? UIBarStyleBlack : UIBarStyleDefault;
}

@end
