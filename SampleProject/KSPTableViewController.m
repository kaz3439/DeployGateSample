//
//  KSPTableViewController.m
//  SampleProject
//
//  Created by 林和弘 on 2014/05/29.
//  Copyright (c) 2014年 Kazuhiro Hayashi. All rights reserved.
//

#import "KSPTableViewController.h"

@interface KSPTableViewController ()
{
    UIView *_headerView;
}

@end

@implementation KSPTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _headerView = [[NSBundle mainBundle] loadNibNamed:@"KSPHeaderView" owner:self options:nil][0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return _headerView.frame.size.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"Crash Report";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"Remote Log";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        abort();
    } else if (indexPath.row == 1) {
        NSLog(@"Hello!!");
    }
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSLog(@"%@", _headerView);
    return _headerView;
}

@end
