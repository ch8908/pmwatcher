//
//  ViewController.m
//  pmwatcher
//
//  Created by wish8 on 1/8/16.
//  Copyright © 2016 oSolve. All rights reserved.
//

#import "ViewController.h"
#import "PMService.h"

@interface ViewController()
@property (nonatomic, strong) PMService *service;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.service = [[PMService alloc] init];
    [self.service fetchDataWithCompletion:^(NSArray *data, NSError *error) {
        NSLog(@">>>>>>>>>>>> data = %@", data);
        NSLog(@">>>>>>>>>>>> error = %@", error);
    }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
