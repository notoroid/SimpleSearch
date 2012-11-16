//
//  MasterViewController.m
//  SimpleSearch
//
//  Created by 能登 要 on 12/11/17.
//  Copyright (c) 2012年 irimasu. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

@interface MasterViewController () {
    NSArray *_objects;
    NSArray *_result;
    __weak IBOutlet UISearchBar *_searchBar;
}
@end

@implementation MasterViewController

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSLog(@"searchText=%@",searchText);
    if( [searchText length] > 0 ){
        _result = [_objects filteredArrayUsingPredicate:
                   [NSPredicate predicateWithFormat:@"SUBQUERY(FUNCTION(SELF, 'allKeys'), $k, SELF[$k] contains[cd] %@).@count > 0", searchText ] ];
        
    }else{
        _result = nil;
    }
    [self.tableView reloadData];
}


- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//	// Do any additional setup after loading the view, typically from a nib.
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;
//
//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;

    _objects =@[
    @{@"prefecture":@"北海道",@"prefectureKana":@"ほっかいどう",@"prefecturalCapital":@"札幌",@"prefecturalCapitalKana":@"さっぽろ"}
    ,@{@"prefecture":@"青森県",@"prefectureKana":@"あおもり",@"prefecturalCapital":@"青森",@"prefecturalCapitalKana":@"あおもり"}
    ,@{@"prefecture":@"岩手県",@"prefectureKana":@"いわて",@"prefecturalCapital":@"盛岡",@"prefecturalCapitalKana":@"もりおか"}
    ,@{@"prefecture":@"宮城県",@"prefectureKana":@"みやぎ",@"prefecturalCapital":@"仙台",@"prefecturalCapitalKana":@"せんだい"}
    ,@{@"prefecture":@"秋田県",@"prefectureKana":@"あきた",@"prefecturalCapital":@"秋田",@"prefecturalCapitalKana":@"あきた"}
    ,@{@"prefecture":@"山形県",@"prefectureKana":@"やまがた",@"prefecturalCapital":@"山形",@"prefecturalCapitalKana":@"やまがた"}
    ,@{@"prefecture":@"福島県",@"prefectureKana":@"ふくしま",@"prefecturalCapital":@"福島",@"prefecturalCapitalKana":@"ふくしま"}
    ,@{@"prefecture":@"茨城県",@"prefectureKana":@"いばらき",@"prefecturalCapital":@"水戸",@"prefecturalCapitalKana":@"みと"}
    ,@{@"prefecture":@"栃木県",@"prefectureKana":@"とちぎ",@"prefecturalCapital":@"宇都宮",@"prefecturalCapitalKana":@"うつのみや"}
    ,@{@"prefecture":@"群馬県",@"prefectureKana":@"ぐんま",@"prefecturalCapital":@"前橋",@"prefecturalCapitalKana":@"まえばし"}
    ,@{@"prefecture":@"埼玉県",@"prefectureKana":@"さいたま",@"prefecturalCapital":@"さいたま",@"prefecturalCapitalKana":@"さいたま"}
    ,@{@"prefecture":@"千葉県",@"prefectureKana":@"ちば",@"prefecturalCapital":@"千葉",@"prefecturalCapitalKana":@"ちば"}
    ,@{@"prefecture":@"東京都",@"prefectureKana":@"とうきょう",@"prefecturalCapital":@"東京",@"prefecturalCapitalKana":@"とうきょう"}
    ,@{@"prefecture":@"神奈川県",@"prefectureKana":@"かながわ",@"prefecturalCapital":@"横浜",@"prefecturalCapitalKana":@"よこはま"}
    ,@{@"prefecture":@"新潟県",@"prefectureKana":@"にいがた",@"prefecturalCapital":@"新潟",@"prefecturalCapitalKana":@"にいがた"}
    ,@{@"prefecture":@"富山県",@"prefectureKana":@"とやま",@"prefecturalCapital":@"富山",@"prefecturalCapitalKana":@"とやま"}
    ,@{@"prefecture":@"石川県",@"prefectureKana":@"いしかわ",@"prefecturalCapital":@"金沢",@"prefecturalCapitalKana":@"かなざわ"}
    ,@{@"prefecture":@"福井県",@"prefectureKana":@"ふくい",@"prefecturalCapital":@"福井",@"prefecturalCapitalKana":@"ふくい"}
    ,@{@"prefecture":@"山梨県",@"prefectureKana":@"やまなし",@"prefecturalCapital":@"甲府",@"prefecturalCapitalKana":@"こうふ"}
    ,@{@"prefecture":@"長野県",@"prefectureKana":@"ながの",@"prefecturalCapital":@"長野",@"prefecturalCapitalKana":@"ながの"}
    ,@{@"prefecture":@"岐阜県",@"prefectureKana":@"ぎふ",@"prefecturalCapital":@"岐阜",@"prefecturalCapitalKana":@"ぎふ"}
    ,@{@"prefecture":@"静岡県",@"prefectureKana":@"しずおか",@"prefecturalCapital":@"静岡",@"prefecturalCapitalKana":@"しずおか"}
    ,@{@"prefecture":@"愛知県",@"prefectureKana":@"あいち",@"prefecturalCapital":@"名古屋",@"prefecturalCapitalKana":@"なごや"}
    ,@{@"prefecture":@"三重県",@"prefectureKana":@"みえ",@"prefecturalCapital":@"津",@"prefecturalCapitalKana":@"つ"}
    ,@{@"prefecture":@"滋賀県",@"prefectureKana":@"しが",@"prefecturalCapital":@"大津",@"prefecturalCapitalKana":@"おおつ"}
    ,@{@"prefecture":@"京都府",@"prefectureKana":@"きょうと",@"prefecturalCapital":@"京都",@"prefecturalCapitalKana":@"きょうと"}
    ,@{@"prefecture":@"大阪府",@"prefectureKana":@"おおさか",@"prefecturalCapital":@"大阪",@"prefecturalCapitalKana":@"おおさか"}
    ,@{@"prefecture":@"兵庫県",@"prefectureKana":@"ひょうご",@"prefecturalCapital":@"神戸",@"prefecturalCapitalKana":@"こうべ"}
    ,@{@"prefecture":@"奈良県",@"prefectureKana":@"なら",@"prefecturalCapital":@"奈良",@"prefecturalCapitalKana":@"なら"}
    ,@{@"prefecture":@"和歌山県",@"prefectureKana":@"わかやま",@"prefecturalCapital":@"和歌山",@"prefecturalCapitalKana":@"わかやま"}
    ,@{@"prefecture":@"鳥取県",@"prefectureKana":@"とっとり",@"prefecturalCapital":@"鳥取",@"prefecturalCapitalKana":@"とっとり"}
    ,@{@"prefecture":@"島根県",@"prefectureKana":@"しまね",@"prefecturalCapital":@"松江",@"prefecturalCapitalKana":@"まつえ"}
    ,@{@"prefecture":@"岡山県",@"prefectureKana":@"おかやま",@"prefecturalCapital":@"岡山",@"prefecturalCapitalKana":@"おかやま"}
    ,@{@"prefecture":@"広島県",@"prefectureKana":@"ひろしま",@"prefecturalCapital":@"広島",@"prefecturalCapitalKana":@"ひろしま"}
    ,@{@"prefecture":@"山口県",@"prefectureKana":@"やまぐち",@"prefecturalCapital":@"山口",@"prefecturalCapitalKana":@"やまぐち"}
    ,@{@"prefecture":@"徳島県",@"prefectureKana":@"とくしま",@"prefecturalCapital":@"徳島",@"prefecturalCapitalKana":@"とくしま"}
    ,@{@"prefecture":@"香川県",@"prefectureKana":@"かがわ",@"prefecturalCapital":@"高松",@"prefecturalCapitalKana":@"たかまつ"}
    ,@{@"prefecture":@"愛媛県",@"prefectureKana":@"えひめ",@"prefecturalCapital":@"松山",@"prefecturalCapitalKana":@"まつやま"}
    ,@{@"prefecture":@"高知県",@"prefectureKana":@"こうち",@"prefecturalCapital":@"高知",@"prefecturalCapitalKana":@"こうち"}
    ,@{@"prefecture":@"福岡県",@"prefectureKana":@"ふくおか",@"prefecturalCapital":@"福岡",@"prefecturalCapitalKana":@"ふくおか"}
    ,@{@"prefecture":@"佐賀県",@"prefectureKana":@"さが",@"prefecturalCapital":@"佐賀",@"prefecturalCapitalKana":@"さが"}
    ,@{@"prefecture":@"長崎県",@"prefectureKana":@"ながさき",@"prefecturalCapital":@"長崎",@"prefecturalCapitalKana":@"ながさき"}
    ,@{@"prefecture":@"熊本県",@"prefectureKana":@"くまもと",@"prefecturalCapital":@"熊本",@"prefecturalCapitalKana":@"くまもと"}
    ,@{@"prefecture":@"大分県",@"prefectureKana":@"おおいた",@"prefecturalCapital":@"大分",@"prefecturalCapitalKana":@"おおいた"}
    ,@{@"prefecture":@"宮崎県",@"prefectureKana":@"みやざき",@"prefecturalCapital":@"宮崎",@"prefecturalCapitalKana":@"みやざき"}
    ,@{@"prefecture":@"鹿児島県",@"prefectureKana":@"かごしま",@"prefecturalCapital":@"鹿児島",@"prefecturalCapitalKana":@"かごしま"}
    ,@{@"prefecture":@"沖縄県",@"prefectureKana":@"おきなわ",@"prefecturalCapital":@"那覇",@"prefecturalCapitalKana":@"なは"}
    ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = 0;
    switch( section ){
    case 0:
        count = _result == nil ? [_objects count] : 0;
        break;
    case 1:
        count = [_result count];
        break;
    }
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDictionary* dic = _result != nil ? _result[indexPath.row] : _objects[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@(%@)",dic[@"prefecture"],dic[@"prefectureKana"] ];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDictionary* dic = _result != nil ? _result[indexPath.row] : _objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:dic];
    }
}

@end
