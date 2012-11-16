//
//  DetailViewController.h
//  SimpleSearch
//
//  Created by 能登 要 on 12/11/17.
//  Copyright (c) 2012年 irimasu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
