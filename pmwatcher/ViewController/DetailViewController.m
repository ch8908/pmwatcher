//
// Created by wish8 on 2/18/16.
// Copyright (c) 2016 oSolve. All rights reserved.
//

#import "DetailViewController.h"
#import "PMRecord.h"
#import "PMRecordViewModel.h"
#import "View+MASAdditions.h"

@interface DetailViewController()
@property (nonatomic, strong) PMRecordViewModel *viewModel;
@end

@implementation DetailViewController

- (instancetype)initWithRecord:(PMRecord *) record {
    self = [super init];
    if (self) {
        PMRecordViewModel *viewModel = [[PMRecordViewModel alloc] initWithRecord:record];
        self.viewModel = viewModel;
    }
    return self;
}

- (void)loadView {
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *colorView = [[UIView alloc] init];
    colorView.backgroundColor = self.viewModel.recordColor;
    [self.view addSubview:colorView];
    [colorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view).multipliedBy(0.5);
        make.height.equalTo(@(100));
        make.center.equalTo(self.view);
    }];

    UILabel *label = [[UILabel alloc] init];
    label.text = self.viewModel.recordDescription;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(colorView);
        make.top.equalTo(colorView.mas_bottom).offset(8);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end