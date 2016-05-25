//
//  DetailWebViewController.m
//  Squashmag
//
//  Created by Abbin Varghese on 25/05/16.
//  Copyright © 2016 Abbin Varghese. All rights reserved.
//

#import "DetailWebViewController.h"
#import <WebKit/WebKit.h>

@interface DetailWebViewController ()

@property(strong, nonatomic) WKWebView *webView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UILabel *WebSiteName;

@end

@implementation DetailWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _containerView.layer.cornerRadius = 7;
    _containerView.layer.masksToBounds = YES;
    
    _webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, _progressView.frame.origin.y+2, self.view.frame.size.width, self.view.frame.size.height)];
    [_webView addObserver:self forKeyPath:NSStringFromSelector(@selector(estimatedProgress)) options:NSKeyValueObservingOptionNew context:NULL];

    [self.view addSubview:_webView];
    NSString *url = @"http://mashable.com/";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [_webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)backClicked:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(estimatedProgress))] && object == self.webView) {
        [self.progressView setAlpha:1.0f];
        [self.progressView setProgress:self.webView.estimatedProgress animated:YES];
        
        if(self.webView.estimatedProgress >= 1.0f) {
            [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
                [self.progressView setAlpha:0.0f];
            } completion:^(BOOL finished) {
                [self.progressView setProgress:0.0f animated:NO];
            }];
        }
    }
    else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)dealloc {
    
    if ([self isViewLoaded]) {
        [self.webView removeObserver:self forKeyPath:NSStringFromSelector(@selector(estimatedProgress))];
    }
}



@end
