//
//  CircleView.m
//  FunWithCoreAnimation
//
//  Created by Ben Ford on 5/4/13.
//  Copyright (c) 2013 Ben Ford. All rights reserved.
//

#import "CircleView.h"
#import <QuartzCore/QuartzCore.h>

@implementation CircleView

- (id)initWithWidth:(CGFloat)width
{
    if ((self = [super initWithFrame:CGRectMake(0, 0, width, width)])) {
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(context, rect);
    CGContextSetFillColorWithColor(context, [UIColor colorWithWhite:0.5f alpha:1.0f].CGColor);
    CGContextFillPath(context);
}

@end
