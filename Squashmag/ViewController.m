//
//  ViewController.m
//  Squashmag
//
//  Created by Abbin Varghese on 22/05/16.
//  Copyright © 2016 Abbin Varghese. All rights reserved.
//

#import "ViewController.h"
#import "YSLDraggableCardContainer.h"
#import "CardView.h"
#import "Popover-swift.h"
#import "PopOverCell.h"
#import "DetailWebViewController.h"
#import "SettingsViewController.h"

typedef NS_ENUM(NSInteger, popOverIndex) {
    Share,
    BookMark,
    Refresh,
    Settings
};

@interface ViewController ()<YSLDraggableCardContainerDelegate, YSLDraggableCardContainerDataSource>

@property (nonatomic, strong) YSLDraggableCardContainer *container;
@property (nonatomic, strong) NSMutableArray *datas;
@property (nonatomic, strong) Popover *popover;
@property (weak, nonatomic) IBOutlet UIButton *option;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat spacing = self.view.frame.size.width/9;
    self.option.imageEdgeInsets = UIEdgeInsetsMake(15, spacing, spacing, 15);
    _container = [[YSLDraggableCardContainer alloc]init];
    _container.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _container.backgroundColor = [UIColor clearColor];
    _container.dataSource = self;
    _container.delegate = self;
    _container.canDraggableDirection = YSLDraggableDirectionLeft | YSLDraggableDirectionRight | YSLDraggableDirectionUp | YSLDraggableDirectionDown;
    [self.view insertSubview:_container atIndex:0];
    
    [self loadData];

    [_container reloadCardContainer];
}

- (void)loadData
{
    _datas = [NSMutableArray array];
    
    for (int i = 0; i < 500; i++) {
        NSDictionary *dict = @{@"image" : [NSString stringWithFormat:@"photo_sample_0%ld.jpg",(long)[self rand]],
                               @"name" : @"YSLDraggableCardContainer Demo"};
        [_datas addObject:dict];
    }
}

-(NSInteger)rand{
    NSString *min = @"1"; //Get the current text from your minimum and maximum textfields.
    NSString *max = @"7";
    
    int randNum = rand() % ([max intValue] - [min intValue]) + [min intValue]; //create the random number.
    
    NSString *num = [NSString stringWithFormat:@"%d", randNum];
    return [num integerValue];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- YSLDraggableCardContainer DataSource
- (UIView *)cardContainerViewNextViewWithIndex:(NSInteger)index
{
    NSDictionary *dict = _datas[index];
    CardView *view = [[CardView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    view.image = [UIImage imageNamed:dict[@"image"]];
    view.title = @"Adele premieres trippy music video for 'Send My Love'";
    view.body = @"The reasoning here is pretty straightforward: Anyone with an amply charged phone can afford to wait and see if Uber's real-time demand-based pricing system might let up on the extra charge. But the prospect of being stranded with a dead phone makes time more of the essence. Uber knows when your phone battery is running low because its app collects that information in order to switch into power-saving mode. But Chen swears Uber would never use that The reasoning here is pretty straightforward: Anyone with an amply charged phone can afford to wait and see if Uber's real-time";
    return view;
}

- (NSInteger)cardContainerViewNumberOfViewInIndex:(NSInteger)index
{
    return _datas.count;
}

#pragma mark -- YSLDraggableCardContainer Delegate
- (void)cardContainerView:(YSLDraggableCardContainer *)cardContainerView didEndDraggingAtIndex:(NSInteger)index draggableView:(UIView *)draggableView draggableDirection:(YSLDraggableDirection)draggableDirection
{
    if (draggableDirection == YSLDraggableDirectionLeft) {
        [cardContainerView movePositionWithDirection:draggableDirection
                                         isAutomatic:NO];
    }
    
    if (draggableDirection == YSLDraggableDirectionRight) {
        [cardContainerView movePositionWithDirection:draggableDirection
                                         isAutomatic:NO];
    }
    
    if (draggableDirection == YSLDraggableDirectionUp) {
        [cardContainerView movePositionWithDirection:draggableDirection
                                         isAutomatic:NO];
    }
    
    if (draggableDirection == YSLDraggableDirectionDown) {
        [cardContainerView movePositionWithDirection:draggableDirection
                                         isAutomatic:NO];
    }
}

- (void)cardContainderView:(YSLDraggableCardContainer *)cardContainderView updatePositionWithDraggableView:(UIView *)draggableView draggableDirection:(YSLDraggableDirection)draggableDirection widthRatio:(CGFloat)widthRatio heightRatio:(CGFloat)heightRatio
{
//    CardView *view = (CardView *)draggableView;
//    
//    if (draggableDirection == YSLDraggableDirectionDefault) {
//        view.selectedView.alpha = 0;
//    }
//    
//    if (draggableDirection == YSLDraggableDirectionLeft) {
//        view.selectedView.backgroundColor = RGB(215, 104, 91);
//        view.selectedView.alpha = widthRatio > 0.8 ? 0.8 : widthRatio;
//    }
//    
//    if (draggableDirection == YSLDraggableDirectionRight) {
//        view.selectedView.backgroundColor = RGB(114, 209, 142);
//        view.selectedView.alpha = widthRatio > 0.8 ? 0.8 : widthRatio;
//    }
//    
//    if (draggableDirection == YSLDraggableDirectionUp) {
//        view.selectedView.backgroundColor = RGB(66, 172, 225);
//        view.selectedView.alpha = heightRatio > 0.8 ? 0.8 : heightRatio;
//    }
}

- (void)cardContainerViewDidCompleteAll:(YSLDraggableCardContainer *)container;
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [container reloadCardContainer];
    });
}

- (void)cardContainerView:(YSLDraggableCardContainer *)cardContainerView didSelectAtIndex:(NSInteger)index draggableView:(UIView *)draggableView{
    
    DetailWebViewController *newView = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailWebViewController"];
    newView.url = @"https://www.whatsapp.com/faq/en/iphone/23559013";
    [self.navigationController pushViewController:newView animated:YES];
}


- (IBAction)optionsClicked:(UIButton *)sender {
    CGPoint point = CGPointMake(sender.center.x+10, sender.center.y);
    UIView *aView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, self.view.frame.size.width, 200)];
    
    UITableView* popOverTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, aView.frame.size.width, aView.frame.size.height) style:UITableViewStylePlain];
    [popOverTableView registerNib:[UINib nibWithNibName:@"PopOverCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"PopOverCell"];
    popOverTableView.scrollEnabled = NO;
    popOverTableView.dataSource = self;
    popOverTableView.delegate = self;
    
    [aView addSubview:popOverTableView];
    
    _popover = [[Popover alloc] init];
    [_popover show:aView point:point];
}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PopOverCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PopOverCell" forIndexPath:indexPath];
    switch (indexPath.row) {
        case Settings:
            cell.imageView.image = [UIImage imageNamed:@"Settings"];
            cell.cellTitle.text = @"Go to Settings";
            break;
        case Share:
            cell.imageView.image = [UIImage imageNamed:@"Share"];
            cell.cellTitle.text = @"Share this article";
            break;
        case Refresh:
            cell.imageView.image = [UIImage imageNamed:@"Refresh"];
            cell.cellTitle.text = @"Refresh";
            break;
        case BookMark:
            cell.imageView.image = [UIImage imageNamed:@"Bookmark"];
            cell.cellTitle.text = @"Bookmark this article";
            break;
            
        default:
            break;
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [_popover dismiss];
    switch (indexPath.row) {
        case Share:{
            
        }
            break;
        case Settings:{
            UINavigationController *newView = [self.storyboard instantiateViewControllerWithIdentifier:@"SettingsViewController"];
            [self presentViewController:newView animated:YES completion:^{
                
            }];
        }
            break;
        case BookMark:{
            
        }
            break;
        case Refresh:{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                [_container reloadCardContainer];
            });
        }
            break;
            
        default:
            break;
    }
}
@end
