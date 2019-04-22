#import "SubViewController.h"

@implementation SubViewController

-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    BOOL isDark = self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark;
    self.styleLabel.text = isDark ? @"Style Dark" : @"Style Light";
}

@end
