#import "TabBarController.h"

@implementation TabBarController

-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    BOOL isDark = self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark;
    self.tabBar.barStyle = isDark ? UIBarStyleBlack : UIBarStyleDefault;
    self.tabBar.tintColor = isDark ? [UIColor whiteColor] : self.tabBar.window.tintColor;
}

@end
