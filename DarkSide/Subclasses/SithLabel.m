#import "SithLabel.h"

@implementation SithLabel

+ (void)load {
    UITraitCollection *darkTrait = [UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleDark];
    [[self appearanceForTraitCollection:darkTrait] setTextColor:[UIColor whiteColor]];
    UITraitCollection *lightTrait = [UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleLight];
    [[self appearanceForTraitCollection:lightTrait] setTextColor:[UIColor blackColor]];
}

@end
