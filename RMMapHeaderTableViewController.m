//
//  RMMapHeaderTableViewController.m
//  RMMapTableHeaderViewDemo
//
//  Created by Rune Madsen on 2014-07-12.
//  Copyright (c) 2014 Rune Madsen. All rights reserved.
//

#import "RMMapHeaderTableViewController.h"

@interface RMMapHeaderTableViewController ()

@property (nonatomic, strong) UIView *containerView;

@end

@implementation RMMapHeaderTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupMapheader];
}

- (void)setupMapheader {
    self.tableHeaderViewHeight = 200;
    
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(0, -self.tableView.contentInset.top, CGRectGetWidth(self.tableView.frame), self.tableHeaderViewHeight + self.tableView.contentInset.top)];
    self.containerView.backgroundColor = [UIColor redColor];
    self.containerView.clipsToBounds = YES;
    
    self.mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.containerView.frame), CGRectGetHeight(self.tableView.frame) + self.tableView.contentInset.top + self.tableView.contentInset.bottom)];
    self.mapView.delegate = self;
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
    self.mapView.showsUserLocation = YES;
    [self.containerView addSubview:self.mapView];
    
    UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), CGRectGetHeight(self.containerView.frame) - self.tableView.contentInset.top)];
    [tableHeaderView addSubview:self.containerView];
    [tableHeaderView setBackgroundColor:[UIColor blueColor]];
    tableHeaderView.clipsToBounds = NO;
    
    [self.tableView setTableHeaderView:tableHeaderView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.containerView setFrame:CGRectMake(0, scrollView.contentOffset.y, CGRectGetWidth(self.tableView.frame), CGRectGetHeight(self.tableView.tableHeaderView.frame) + -((scrollView.contentOffset.y + self.tableView.contentInset.top) - self.tableView.contentInset.top))];
    [self.mapView setFrame:CGRectMake(0, (CGRectGetHeight(self.containerView.frame) / 2) - (CGRectGetHeight(self.tableView.frame) / 2) + (self.tableView.contentInset.top / 2), CGRectGetWidth(self.mapView.frame), CGRectGetHeight(self.tableView.frame))];
}

@end
