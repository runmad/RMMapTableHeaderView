//
//  RMMapHeaderTableViewController.h
//  RMMapTableHeaderViewDemo
//
//  Created by Rune Madsen on 2014-07-12.
//  Copyright (c) 2014 Rune Madsen. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface RMMapHeaderTableViewController : UITableViewController <MKMapViewDelegate>

@property (nonatomic, strong) MKMapView *mapView;
@property (nonatomic, assign) CGFloat tableHeaderViewHeight;

@end
