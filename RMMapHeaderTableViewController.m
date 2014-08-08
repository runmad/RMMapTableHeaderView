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
    MKCoordinateSpan span = MKCoordinateSpanMake(0.01, 0.01);
    CLLocationCoordinate2D centerCoordinate = CLLocationCoordinate2DMake(43.6687942, -79.393005);
    MKCoordinateRegion region = MKCoordinateRegionMake(centerCoordinate, span);
    self.mapView.delegate = self;
    [self.mapView setRegion:region];
    //        CGFloat offsetY = (CGRectGetHeight(self.containerView.frame) / 2) - (CGRectGetHeight(self.containerView.frame) / 2) + self.tableView.contentInset.top;// -(mapHeight / 2) + -(offset.y / 2);
    //        [self.mapView setFrame:CGRectMake(0, offsetY, CGRectGetWidth(self.mapView.frame), CGRectGetHeight(self.containerView.frame) + self.tableView.contentInset.top)];
    [self.containerView addSubview:self.mapView];
    
    UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), CGRectGetHeight(self.containerView.frame) - self.tableView.contentInset.top)];
    [tableHeaderView addSubview:self.containerView];
    [tableHeaderView setBackgroundColor:[UIColor blueColor]];
    tableHeaderView.clipsToBounds = NO;
    
    NSLog(@"%@", NSStringFromCGRect(self.containerView.frame));
    NSLog(@"%@", NSStringFromCGRect(tableHeaderView.frame));
    
    [self.tableView setTableHeaderView:tableHeaderView];
    
    NSLog(@"%f", self.tableView.contentOffset.y);
    NSLog(@"%f", self.tableView.contentInset.top);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%f", scrollView.contentOffset.y);
    NSLog(@"%f", self.tableView.contentInset.top);
    NSLog(@"%f", scrollView.contentOffset.y + self.tableView.contentInset.top);
    
    [self.containerView setFrame:CGRectMake(0, scrollView.contentOffset.y, CGRectGetWidth(self.tableView.frame), CGRectGetHeight(self.tableView.tableHeaderView.frame) + -((scrollView.contentOffset.y + self.tableView.contentInset.top) - self.tableView.contentInset.top))];
//    [self.mapView setCenter:CGPointMake(CGRectGetMidX(self.containerView.frame), CGRectGetMidX(self.containerView.frame))];
    [self.mapView setFrame:CGRectMake(0, (CGRectGetHeight(self.containerView.frame) / 2) - (CGRectGetHeight(self.tableView.frame) / 2) + self.tableView.contentInset.top, CGRectGetWidth(self.mapView.frame), CGRectGetHeight(self.tableView.frame))];
}

@end
