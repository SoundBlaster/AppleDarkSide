#import "View.h"

@implementation View

-(void)viewDidMoveToSuperview {
    [super viewDidMoveToSuperview];
    [self updateColor];
}

- (void)viewDidChangeEffectiveAppearance {
    // use KVO for better result
    [self updateColor];
}

- (void)updateLayer {
    [super updateLayer];
    
    [self updateColor];
}

#pragma mark - Custom

- (void)updateColor {
    self.layer.backgroundColor = [self customLayerColor].CGColor;
}

- (NSColor *)customLayerColor {
    if ([self.effectiveAppearance.name isEqualToString: NSAppearanceNameDarkAqua]) {
        return [NSColor darkGrayColor];
    } else {
        return [NSColor lightGrayColor];
    }
}

@end
