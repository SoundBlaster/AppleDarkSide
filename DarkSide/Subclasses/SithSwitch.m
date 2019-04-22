#import "SithSwitch.h"

@implementation SithSwitch

+ (void)load {
    UITraitCollection *darkTrait = [UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleDark];
    [[self appearanceForTraitCollection:darkTrait] setOnTintColor:[UIColor whiteColor]];
    [[self appearanceForTraitCollection:darkTrait] setThumbTintColor:[UIColor blackColor]];
    UITraitCollection *lightTrait = [UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleLight];
    [[self appearanceForTraitCollection:lightTrait] setOnTintColor:[UIColor blackColor]];
    [[self appearanceForTraitCollection:lightTrait] setThumbTintColor:[UIColor whiteColor]];
}

@end
