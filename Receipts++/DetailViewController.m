//
//  DetailViewController.m
//  Receipts++
//
//  Created by Javier Xing on 2017-11-23.
//  Copyright © 2017 Javier Xing. All rights reserved.
//

#import "DetailViewController.h"
#import "Tag+CoreDataClass.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *notesLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *tagLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureView];
}

-(void)configureView{
    self.notesLabel.text = self.receipt.note;
    self.amountLabel.text = [NSString stringWithFormat:@"%d", self.receipt.amount ];
//    self.tagLabel.text = self.receipt.tags[self.tagIndex].tagName;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    
    [dateFormatter setDateFormat:@"dd-MM-yyy HH:mm"];
    NSString *timeStampString= [dateFormatter stringFromDate:self.receipt.timeStamp];
    
    self.dateLabel.text = timeStampString;
}

@end
