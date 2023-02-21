//
//  ZLViewController.m
//  ZL_Categary
//
//  Created by whity on 02/21/2023.
//  Copyright (c) 2023 whity. All rights reserved.
//

#import "ZLViewController.h"
#import "Foo.h"

@interface ZLViewController ()

@end

@implementation ZLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    self.view.backgroundColor = UIColor.cyanColor;

    Foo *f = [[Foo alloc] init];
    [f sayHello];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
