//
//  ViewController.m
//  FunWithCoreAnimation
//
//  Created by Ben Ford on 5/4/13.
//  Copyright (c) 2013 Ben Ford. All rights reserved.
//

#import "ViewController.h"
#import "CircleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CircleView *circleView = [[CircleView alloc] initWithWidth:100];
    
    [self.view addSubview:circleView];
    
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
