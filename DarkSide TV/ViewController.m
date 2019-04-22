#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.button addTarget:self action:@selector(changeTrait:) forControlEvents:UIControlEventPrimaryActionTriggered];
    
    [self updateButtonTitle];
    [self updateColorView];
}

-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {

    NSLog(@"userInterfaceStyle: %@", self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark ? @"dark" : @"light");
    BOOL changed = self.traitCollection.userInterfaceStyle != previousTraitCollection.userInterfaceStyle;
    [UIView animateWithDuration:changed?0.5:0.0 animations:^{
        [self updateColorView];
        [self updateButtonTitle];
    } completion:nil];
}

- (IBAction)changeTrait:(id)sender {
    UITraitCollection *trait = [self traitCollectionForStyle:self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark ? UIUserInterfaceStyleLight : UIUserInterfaceStyleDark];
    [self.view.window.screen performSelector:@selector(_setDefaultTraitCollection:) withObject:trait];
}

#pragma mark - Private

- (void)updateButtonTitle {
    NSString *title = self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark ? @"set Light" : @"set Dark";
    [self.button setTitle:title forState:UIControlStateNormal];
}

- (void)updateColorView {
//    self.colorView.backgroundColor = self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark ? [UIColor redColor] : [UIColor blueColor];
}

- (UITraitCollection *)traitCollectionForStyle:(UIUserInterfaceStyle)style {
    UITraitCollection *traitCollection = [UITraitCollection traitCollectionWithUserInterfaceStyle:style];
    return [UITraitCollection traitCollectionWithTraitsFromCollections:@[self.traitCollection, traitCollection]];
}

@end
