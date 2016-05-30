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
#import "DetailWebViewController.h"
#import "SettingsViewController.h"
#import "BIZCircularTransitionHandler.h"
#import "Article.h"
#import "FeHourGlass.h"

typedef NS_ENUM(NSInteger, popOverIndex) {
    Share,
    BookMark,
    Refresh,
    Settings
};

@interface ViewController ()<YSLDraggableCardContainerDelegate, YSLDraggableCardContainerDataSource>

@property (nonatomic, strong) YSLDraggableCardContainer *container;
@property (nonatomic, strong) NSMutableArray *articles;
@property (nonatomic, strong) Popover *popover;
@property (weak, nonatomic) IBOutlet UIButton *option;
@property (nonatomic, strong) BIZCircularTransitionHandler *circularTransitionHandler;
@property (nonatomic, strong) PFQuery *query;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _query = [PFQuery queryWithClassName:@"articles"];
    _query.cachePolicy = kPFCachePolicyCacheElseNetwork;
    self.circularTransitionHandler = [[BIZCircularTransitionHandler alloc] init];
    
    CGFloat spacing = self.view.frame.size.width/20;
    self.option.imageEdgeInsets = UIEdgeInsetsMake(0, spacing, spacing, 0);
    
    _container = [[YSLDraggableCardContainer alloc]init];
    _container.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _container.backgroundColor = [UIColor clearColor];
    _container.dataSource = self;
    _container.delegate = self;
    _container.canDraggableDirection = YSLDraggableDirectionLeft | YSLDraggableDirectionRight | YSLDraggableDirectionUp | YSLDraggableDirectionDown;
    [self.view insertSubview:_container atIndex:0];
    
    [self loadData];
}

- (void)loadData{
    FeHourGlass *hourGlass = [[FeHourGlass alloc] initWithView:self.view];
    [self.view addSubview:hourGlass];
    [hourGlass show];
    
    [_query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error.code != 120) {
            [hourGlass dismiss];
            [hourGlass removeFromSuperview];
        }
        if (!error) {
            self.articles = [objects mutableCopy];
            [_container reloadCardContainer];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark -- YSLDraggableCardContainer DataSource

- (UIView *)cardContainerViewNextViewWithIndex:(NSInteger)index
{
    Article *obj = _articles[index];
    CardView *view = [[CardView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    view.imageView.file = obj.articlePhoto;
    view.title = obj.articleHeading;
    view.body = obj.articleBody;
    view.imageView.image = [UIImage imageNamed:@"imagePLaceholder"];
    [view.imageView loadInBackground];
    return view;
}

- (NSInteger)cardContainerViewNumberOfViewInIndex:(NSInteger)index
{
    return _articles.count;
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

- (void)cardContainerView:(YSLDraggableCardContainer *)cardContainerView didSelectAtIndex:(NSInteger)index draggableView:(UIView *)draggableView touchPoint:(CGPoint)touchPoint{
    Article *art = [_articles objectAtIndex:index];
    DetailWebViewController *newView = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailWebViewController"];
    newView.url = art.articleURL;
    newView.webSite = art.websiteName;
    [self.circularTransitionHandler transitionWithDestinationViewController:newView initialTransitionPoint:touchPoint];
    [self presentViewController:newView animated:YES completion:nil];
}


- (IBAction)optionsClicked:(UIButton *)sender {
    UINavigationController *newView = [self.storyboard instantiateViewControllerWithIdentifier:@"SettingsViewController"];
    [self presentViewController:newView animated:YES completion:^{
        
    }];
}

@end
