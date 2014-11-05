//
//  RestroomDetailViewController.h
//  Refugestrooms
//
//  Created by Elena on 11/4/14.
//  Copyright (c) 2014 gokhandemirhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface RestroomDetailViewController : UIViewController

@property (strong, nonatomic) NSMutableDictionary *restroomObject;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

-(instancetype) initWithRestroom:(NSMutableDictionary *) dict;
@end
