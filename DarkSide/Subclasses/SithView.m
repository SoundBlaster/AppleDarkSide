#import "SithView.h"

@implementation SithView

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
//    [self logUserInteraceStyle:previousTraitCollection];
//    [self logUserInteraceStyle:self.traitCollection];
}

+ (void)load {
    UITraitCollection *darkTrait = [UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleDark];
    [[self appearanceForTraitCollection:darkTrait] setBackgroundColor:[UIColor blackColor]];
    UITraitCollection *lightTrait = [UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleLight];
    [[self appearanceForTraitCollection:lightTrait] setBackgroundColor:[UIColor lightGrayColor]];
}

#pragma mark - Private

- (void)logUserInteraceStyle {
    [self logUserInteraceStyle:self.traitCollection];
}

- (void)logUserInteraceStyle:(UITraitCollection *)traitCollection {
    NSLog(@"%@ userInterfaceStyle: %@", self, traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark ? @"dark" : @"light");
}

@end
