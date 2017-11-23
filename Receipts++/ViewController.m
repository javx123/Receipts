//
//  ViewController.m
//  Receipts++
//
//  Created by Javier Xing on 2017-11-23.
//  Copyright © 2017 Javier Xing. All rights reserved.
//

#import "ViewController.h"
#import "Receipt+CoreDataClass.h"
#import "Tag+CoreDataClass.h"
#import "AppDelegate.h"
#import "DetailViewController.h"
#import "DataHandler.h"
#import "AddReceiptViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSArray <Tag*>* tags;
@property (nonatomic, strong) DataHandler *dataHandler;


@end

@implementation ViewController

-(void)setTags:(NSArray<Tag *> *)tags{
    _tags = tags;
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.dataHandler = [[DataHandler alloc]init];
    self.tags = [self.dataHandler fetchTagData];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fetchData) name:NSManagedObjectContextDidSaveNotification object:nil];
}

#pragma mark - Data Methods

-(void)fetchData{
    self.tags = [self.dataHandler fetchTagData];
}


#pragma mark - TableView DataSource Methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  self.tags.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tags[section].receipts.count;
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.tags[section].tagName;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.tags[indexPath.section].receipts[indexPath.row].note;
    ;
    return cell;
}

#pragma mark - Segue Methods

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Receipt *receipt = self.tags[indexPath.section].receipts[indexPath.row];
        DetailViewController *controller = [segue destinationViewController];
        [controller setReceipt:receipt];
        [controller setTagIndex:indexPath.section];
        
    }
    if ([segue.identifier isEqualToString:@"addReceipt"]) {
        UINavigationController *navController = [segue destinationViewController];
        AddReceiptViewController *controller = [navController viewControllers][0];
        [controller setDataHandler:self.dataHandler];
    }
}




@end
