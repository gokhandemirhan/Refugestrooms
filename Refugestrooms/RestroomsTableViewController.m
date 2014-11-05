//
//  RestroomsTableViewController.m
//  Refugestrooms
//
//  Created by Elena on 11/4/14.
//  Copyright (c) 2014 gokhandemirhan. All rights reserved.
//

#import "RestroomsTableViewController.h"
#import "AFNetworking.h"
#import "RestroomTableViewCell.h"
#import "RestroomDetailViewController.h"

#define weburl @"http://www.refugerestrooms.org/api/v1/restrooms.json"

@interface RestroomsTableViewController ()


@end

@implementation RestroomsTableViewController

@synthesize restroomsTableView = _restroomsTableView;
@synthesize restroomsDataForTable = _restroomsDataForTable;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchRestData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (IBAction)fetchRestData; {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:weburl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        _restroomsDataForTable = responseObject;
        [_restroomsTableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.restroomsDataForTable count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"RestroomCell";
    RestroomTableViewCell *cell = (RestroomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"RestroomTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.nameText.text = [self.restroomsDataForTable[indexPath.row] objectForKey:@"name"];
    cell.accessibleText.text = [self.restroomsDataForTable[indexPath.row] objectForKey:@"accessible"] ? @"YES" : @"NO";
    cell.unisexText.text = [self.restroomsDataForTable[indexPath.row] objectForKey:@"unisex"] ? @"YES" : @"NO";
    cell.dateText.text = [self.restroomsDataForTable[indexPath.row] objectForKey:@"updated_at"];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSMutableDictionary *dict = nil;
    dict = [self.restroomsDataForTable objectAtIndex:indexPath.row];
    
    
    RestroomDetailViewController *detailsViewController = [[RestroomDetailViewController alloc] initWithRestroom:dict];
    [self.navigationController pushViewController:detailsViewController animated:YES];
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
