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
#import "PathView.h"

@interface ViewController ()

@end

@implementation ViewController
{
    PathView *pathView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    pathView = [[PathView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 400.0f, 400.0f)];
//    pathView.hidden = YES;
    [self.view addSubview:pathView];
    
    UIImageView *button = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ButtonGreen.png"]];
    button.center = CGPointMake(50.0f, 50.0f);
    button.userInteractionEnabled = YES;
    [self.view addSubview:button];
    
	UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapCircle:)];
    [button addGestureRecognizer:tapGesture];
}

- (void)didTapCircle:(UITapGestureRecognizer *)tapGesture
{
    [self toggleBasicAnimationView:tapGesture.view];
//    [self toggleKeyframeAnimation:tapGesture.view];
    
//    [self toggleKeyframeAlongPath:tapGesture.view];
//    [self toggleKeyframeAlongPathWithScale:tapGesture.view];
}

- (void)toggleKeyframeAlongPathWithScale:(UIView *)view
{
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 50.0f, 50.0f);
    CGPathAddQuadCurveToPoint(path, NULL, 200, 50.0f, 200.0f, 200.0f);
    
    CAKeyframeAnimation *movement = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    movement.path = path;
    
    if (view.layer.position.x == 50.0f)
        movement.keyTimes = @[ @0.0, @1.0 ];
    else
        movement.keyTimes = @[ @1.0, @0.0 ];
    
    
    CAKeyframeAnimation *xScale = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.x"];
    xScale.values = @[ @1.0f, @2.0f, @1.0f ];
    xScale.keyTimes = @[ @0.0f, @0.5f, @1.0f ];
    
    CAKeyframeAnimation *yScale = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.y"];
    yScale.values = @[ @1.0f, @2.0f, @1.0f ];
    yScale.keyTimes = @[ @0.0f, @0.5f, @1.0f ];

    
    group.animations = @[movement, xScale, yScale];
    group.duration = 1.3f;
    
    [view.layer addAnimation:group forKey:@"go"];
    
    
    if (view.layer.position.x == 50.0f)
        view.layer.position = CGPointMake(200.0f, 200.0f);
    else
        view.layer.position = CGPointMake(50.0f, 50.0f);
    
}

- (void)toggleKeyframeAlongPath:(UIView *)view
{
        
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 50.0f, 50.0f);
    CGPathAddQuadCurveToPoint(path, NULL, 200, 50.0f, 200.0f, 200.0f);
    
    CAKeyframeAnimation *movement = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    movement.path = path;

    if (view.layer.position.x == 50.0f)
        movement.keyTimes = @[ @0.0, @1.0 ];
    else
        movement.keyTimes = @[ @1.0, @0.0 ];

    movement.duration = 0.5f;

    [view.layer addAnimation:movement forKey:@"go"];
    
    
    if (view.layer.position.x == 50.0f)
        view.layer.position = CGPointMake(200.0f, 200.0f);
    else
        view.layer.position = CGPointMake(50.0f, 50.0f);
    
}

- (void)toggleKeyframeAnimation:(UIView *)view
{
    if (view.layer.position.x == 50.0f) {
        
        CAAnimationGroup *group = [CAAnimationGroup animation];
        
        CAKeyframeAnimation *xMovement = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
        xMovement.values = @[ @50.0, @100.0f, @400.0 ];
        xMovement.keyTimes = @[ @0.0, @0.5f, @1.0 ];

        
        CAKeyframeAnimation *yMovement = [CAKeyframeAnimation animationWithKeyPath:@"position.y"];
        yMovement.values = @[ @50.0, @400.0 ];
        yMovement.keyTimes = @[ @0.0, @1.0 ];
        
        group.animations = @[xMovement, yMovement];
        group.duration = 1.3f;
        
        [view.layer addAnimation:group forKey:@"go"];
        
        
        view.layer.position = CGPointMake(400.0f, 400.f);
        
    } else {
        
        CAAnimationGroup *group = [CAAnimationGroup animation];
        
        CAKeyframeAnimation *xMovement = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
        xMovement.values = @[ @400.0, @100.0f, @50.0 ];
        xMovement.keyTimes = @[ @0.0, @0.5f, @1.0 ];
        
        CAKeyframeAnimation *yMovement = [CAKeyframeAnimation animationWithKeyPath:@"position.y"];
        yMovement.values = @[ @400.0, @50.0 ];
        yMovement.keyTimes = @[ @0.0, @1.0 ];
        
        group.animations = @[xMovement, yMovement];
        group.duration = 1.3f;
        
        [view.layer addAnimation:group forKey:@"go"];
        
        
        view.layer.position = CGPointMake(50.0f, 50.0f);        
    }
}

- (void)toggleBasicAnimationView:(UIView *)view
{
    if (view.layer.position.x == 50.0f) {
        
        CABasicAnimation *movement = [CABasicAnimation animationWithKeyPath:@"position"];
        movement.fromValue = [NSValue valueWithCGPoint:CGPointMake(50.0f, 50.0f)];
        movement.toValue = [NSValue valueWithCGPoint:CGPointMake(200.0f, 200.0f)];
        movement.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        movement.duration = 0.3f;
        
        [view.layer addAnimation:movement forKey:@"go"];
        
        view.layer.position = CGPointMake(200.0f, 200.0f);
    } else {
        CABasicAnimation *movement = [CABasicAnimation animationWithKeyPath:@"position"];
        movement.fromValue = [NSValue valueWithCGPoint:CGPointMake(200.0f, 200.0f)];
        movement.toValue = [NSValue valueWithCGPoint:CGPointMake(50.0f, 50.0f)];
        movement.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        movement.duration = 0.3f;
        
        [view.layer addAnimation:movement forKey:@"go"];
        
        view.layer.position = CGPointMake(50.0f, 50.0f);
    }
}
@end
