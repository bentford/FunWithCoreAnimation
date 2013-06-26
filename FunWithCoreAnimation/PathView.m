//
//  PathView.m
//  FunWithCoreAnimation
//
//  Created by Ben Ford on 6/26/13.
//  Copyright (c) 2013 Ben Ford. All rights reserved.
//

#import "PathView.h"

@implementation PathView

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 1.0f);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 50.0f, 50.0f);
    CGPathAddQuadCurveToPoint(path, NULL, 200, 50.0f, 200.0f, 200.0f);

    CGContextAddPath(context, path);
    CGContextDrawPath(context, kCGPathFillStroke);
}


@end
