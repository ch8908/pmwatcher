//
//  ViewController.m
//  pmwatcher
//
//  Created by wish8 on 1/8/16.
//  Copyright © 2016 oSolve. All rights reserved.
//

#import "ViewController.h"
#import "PMService.h"
#import "View+MASAdditions.h"
#import "PMRecord.h"
#import "DetailViewController.h"

static NSString *const RecordReuseIdentifier = @"RecordReuseIdentifier";

@interface ViewController()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) PMService *service;
@property (nonatomic, strong) NSArray *records;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)loadView {
    [super loadView];
    UITableView *tableView = [[UITableView alloc] init];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:RecordReuseIdentifier];
    self.tableView = tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.service = [[PMService alloc] init];
    __weak typeof(self) weakSelf = self;
    [self.service fetchDataWithCompletion:^(NSArray *data, NSError *error) {
        weakSelf.records = data;
        [weakSelf.tableView reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger) section {
    return self.records.count;
}

- (UITableViewCell *)tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *) indexPath {
    __kindof UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:RecordReuseIdentifier
                                                                     forIndexPath:indexPath];
    PMRecord *record = self.records[indexPath.row];
    cell.textLabel.text = record.siteName;
    return cell;
}

- (void)tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *) indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    PMRecord *record = self.records[indexPath.row];
    DetailViewController *controller = [[DetailViewController alloc] initWithRecord:record];
    [self.navigationController pushViewController:controller animated:YES];
}


@end
