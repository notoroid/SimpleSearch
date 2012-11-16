//
//  DetailViewController.m
//  SimpleSearch
//
//  Created by 能登 要 on 12/11/17.
//  Copyright (c) 2012年 irimasu. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
{
    __weak IBOutlet UILabel *_labelPrefecturalCapital;
    __weak IBOutlet UILabel *_labelPrefecture;
}
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        NSDictionary* dic = _detailItem;
        
        _labelPrefecture.text = [NSString stringWithFormat:@"%@(%@)",dic[@"prefecture"],dic[@"prefectureKana"] ];
        _labelPrefecturalCapital.text = [NSString stringWithFormat:@"%@(%@)",dic[@"prefecturalCapital"],dic[@"prefecturalCapitalKana"] ];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
