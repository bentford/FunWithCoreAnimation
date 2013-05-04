//
//  ViewController.m
//  FunWithCoreAnimation
//
//  Created by Ben Ford on 5/4/13.
//  Copyright (c) 2013 Ben Ford. All rights reserved.
//

#import "ViewController.h"
#import "CircleView.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CircleView *circleView = [[CircleView alloc] initWithWidth:100];
    circleView.userInteractionEnabled = YES;
    [self.view addSubview:circleView];
    
	UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapCircle:)];
    [circleView addGestureRecognizer:tapGesture];
}

- (void)didTapCircle:(UITapGestureRecognizer *)tapGesture
{
    [self toggleView:tapGesture.view];
}

- (void)toggleView:(UIView *)view
{
    if (view.layer.position.x == 50.0f) {
        
        CAAnimationGroup *group = [CAAnimationGroup animation];
        
        CAKeyframeAnimation *xMovement = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
        xMovement.values = @[ @50.0, @200.0 ];
        xMovement.keyTimes = @[ @0.0, @1.0 ];
        xMovement.duration = 0.3f;
        xMovement.calculationMode = @"cubic";
        
        CAKeyframeAnimation *yMovement = [CAKeyframeAnimation animationWithKeyPath:@"position.y"];
        yMovement.values = @[ @50.0, @200.0 ];
        yMovement.keyTimes = @[ @0.0, @1.0 ];
        yMovement.duration = 0.3f;
        yMovement.calculationMode = @"cubic";
        
        
        group.animations = @[xMovement,yMovement];
        
        [view.layer addAnimation:group forKey:@"go"];
        
        
        view.layer.position = CGPointMake(200.0f, 200.0f);
        
    } else {
        CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
        keyFrameAnimation.values = @[ @200.0, @50.0 ];
        keyFrameAnimation.keyTimes = @[ @0.0, @1.0 ];
        keyFrameAnimation.duration = 0.3f;
        
        [view.layer addAnimation:keyFrameAnimation forKey:@"go"];
        view.layer.position = CGPointMake(50.0f, 50.0f);
    }
}
@end
