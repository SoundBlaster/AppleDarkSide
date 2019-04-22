#import "ViewController.h"

// for demo only
#define USE_PRIVATE_API YES

@implementation ViewController

-(void)willTransitionToTraitCollection:(UITraitCollection *)newCollection
             withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super willTransitionToTraitCollection:newCollection
                 withTransitionCoordinator:coordinator];
}

-(void)setOverrideTraitCollection:(UITraitCollection *)collection forChildViewController:(UIViewController *)childViewController {
    [super setOverrideTraitCollection:collection
               forChildViewController:childViewController];
}

- (UITraitCollection *)overrideTraitCollectionForChildViewController:(UIViewController *)childViewController {
    BOOL isDarkModeOn = self.styleSwitch.on;
    UIUserInterfaceStyle style = isDarkModeOn ?
                                        UIUserInterfaceStyleDark :
                                        UIUserInterfaceStyleLight;
    return [self traitCollectionForStyle:style];
}

- (UITraitCollection *)traitCollectionForStyle:(UIUserInterfaceStyle)style {
    UITraitCollection *traitCollection = [UITraitCollection
                                          traitCollectionWithUserInterfaceStyle:style];
    return [UITraitCollection
            traitCollectionWithTraitsFromCollections:@[self.traitCollection,
                                                       traitCollection]];
}

- (IBAction)switchToggle:(id)sender {
#ifndef USE_PRIVATE_API
    UIWindow *W = self.view.window;
    CGRect frame = W.frame;
    [W setFrame:CGRectInset(frame, -1000, 0)];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0/60.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [W setFrame:frame];
    });
    return;
#else
    UISwitch *toggle = (UISwitch*)sender;
    BOOL isDarkModeOn = toggle.on;
    UIUserInterfaceStyle style = isDarkModeOn ?
            UIUserInterfaceStyleDark :
            UIUserInterfaceStyleLight;
    //    🤐
    UITraitCollection *trait = [self traitCollectionForStyle:style];
    [self.view.window.screen
     performSelector:@selector(_setDefaultTraitCollection:)
     withObject:trait];
#endif
}

@end
