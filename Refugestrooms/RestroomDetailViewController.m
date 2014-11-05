//
//  RestroomDetailViewController.m
//  Refugestrooms
//
//  Created by Elena on 11/4/14.
//  Copyright (c) 2014 gokhandemirhan. All rights reserved.
//

#import "RestroomDetailViewController.h"

@interface RestroomDetailViewController ()

@end

@implementation RestroomDetailViewController

-(instancetype) initWithRestroom:(NSMutableDictionary *) dict{
    
    self = [super init];
    
    if(self){
        
        self.restroomObject = dict;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeView];
    // Do any additional setup after loading the view from its nib.
}

-(void) initializeView{
    CLLocationCoordinate2D annotationCoord;
    
    annotationCoord.latitude = [[self.restroomObject objectForKey:@"latitude"] floatValue];
    annotationCoord.longitude = [[self.restroomObject objectForKey:@"longitude"] floatValue];
    
    MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
    annotationPoint.coordinate = annotationCoord;
    annotationPoint.title = [self.restroomObject objectForKey:@"name"];
    annotationPoint.subtitle = [self.restroomObject objectForKey:@"street"];
    [self.mapView addAnnotation:annotationPoint];
    [self.mapView setCenterCoordinate:annotationCoord animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
