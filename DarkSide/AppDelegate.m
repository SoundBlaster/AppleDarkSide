#import "AppDelegate.h"
#import <CarPlay/CarPlay.h>

@interface CarPlayRootViewController : UIViewController

@end

@implementation CarPlayRootViewController

-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    NSLog(@"CarPlayRootViewController userInterfaceStyle: %@", self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark ? @"dark" : @"light");
}

@end

@interface AppDelegate () <CPApplicationDelegate>
@property(nonatomic, strong) CPInterfaceController *interfaceController;
@property(nonatomic, strong) UIWindow *carWindow;
@end

@implementation AppDelegate

-(void)application:(UIApplication *)application
didConnectCarInterfaceController:(CPInterfaceController *)interfaceController
          toWindow:(UIWindow *)window {
    NSLog(@"connect: %@", interfaceController);
    
//    self.interfaceController = interfaceController;
//    self.carWindow = window;
//    CarPlayRootViewController *rootViewController = [CarPlayRootViewController new];
//    window.rootViewController = rootViewController;
//    CPMapTemplate *rootTemplate = [self createRootTemplate];
//    [self.interfaceController setRootTemplate:rootTemplate animated:NO];
    
    UITraitCollection *darkTrait = [UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleDark];
    [[UITextField appearanceForTraitCollection:darkTrait] setKeyboardAppearance:UIKeyboardAppearanceDark];
    UITraitCollection *lightTrait = [UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleLight];
    [[UITextField appearanceForTraitCollection:lightTrait] setKeyboardAppearance:UIKeyboardAppearanceLight];
}

-(void)application:(UIApplication *)application
didDisconnectCarInterfaceController:(CPInterfaceController *)interfaceController
        fromWindow:(UIWindow *)window {
    NSLog(@"disconnect: %@", interfaceController);
}

#pragma mark - Private

- (CPMapTemplate*)createRootTemplate {
    CPMapTemplate *mapTemplate = [CPMapTemplate new];
    CPBarButton *categorySearchButton = [[CPBarButton alloc] initWithType:CPBarButtonTypeImage
                                                                  handler:^(CPBarButton * _Nonnull barButton) {
                                                                      [self displayFavoriteCategories];
                                                                  }];
    UIImage *favoritesImage = [UIImage imageNamed:@"favs"];
    categorySearchButton.image = favoritesImage;
    mapTemplate.trailingNavigationBarButtons = @[categorySearchButton];
    return mapTemplate;
}

- (void)displayFavoriteCategories {
    NSLog(@"display");
}

@end
