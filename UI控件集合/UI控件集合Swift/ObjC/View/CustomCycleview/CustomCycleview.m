//
//  CustomCycleview.m
//  CycleView
//
//  Created by 徐雅芳 on 16/5/25.
//  Copyright © 2016年 CycleView. All rights reserved.
//

#import "CustomCycleview.h"
#import "NSTimer+Utility.h"
#import "UIImageView+AFNetworking.h"
#import <SDWebImage/UIImageView+WebCache.h>
//#import "UIImageView+EMWebCache.h"
#import "Defines.h"
//#import "UIViewExt.h"


@interface CustomCycleview()<UIScrollViewDelegate>
{
    CGRect pageControlFrame;
    UIColor *currentColor;
    UIColor *nomalColor;
    
}
@property (nonatomic , strong) UIScrollView *scrollView;
@property (nonatomic , strong) UIPageControl *pageControl;
@property (nonatomic , strong) NSTimer *timer;
@property (nonatomic , assign) NSInteger totalPageCount;
@property (nonatomic , assign) NSInteger currentPageIndex;
@property (nonatomic , strong) NSMutableArray<UIImageView*> *imageArray;
@property (nonatomic , strong) NSMutableArray<UILabel*> *lableArray;
@property (nonatomic , strong) NSMutableArray<UIView*> *viewArray;
@property (nonatomic ,strong) NSMutableArray<UIButton*> *buttonArray;


@end


@implementation CustomCycleview




- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView
{
    self.placeholderImageStr = news_defaultStr;
    
    self.haveBottomView = NO;
    pageControlFrame = CGRectMake(0, CGRectGetHeight(self.frame)-30, CGRectGetWidth(self.frame),30);
    currentColor = ThemeColor;
    nomalColor = Color(244);
    /**
     适应此App添加底部UILabel(用button代替图片和label )
     */
    
    
    self.scrollView = [[UIScrollView alloc]init];
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.scrollEnabled = NO;
    self.scrollView.delegate = self;
    self.scrollView.contentOffset = CGPointZero;
    self.scrollView.contentSize = CGSizeZero;
    
    self.pageControl = [[UIPageControl alloc]init];
    self.pageControl.currentPageIndicatorTintColor = currentColor;
    self.pageControl.pageIndicatorTintColor = nomalColor;
    self.pageControl.hidden = YES;
    
    [self addSubview:self.scrollView];
    [self addSubview:self.pageControl];
    
    self.scrollingSpeed = 5.0;
    self.isAutoScrolling = YES;
    
    self.imageArray = [NSMutableArray array];
    self.lableArray = [NSMutableArray array];
    self.viewArray = [NSMutableArray array];
    self.buttonArray = [NSMutableArray array];
    for (NSInteger i = 0; i < 3; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click)];
        [imageView addGestureRecognizer:tapGes];
        [self.imageArray addObject:imageView];
        [self.scrollView addSubview:imageView];
        if (i == 0) {
            imageView.image = [UIImage imageNamed:_placeholderImageStr];
        }
        
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor colorWithWhite:0 alpha:.7];
        [self.viewArray addObject:view];
        [self.scrollView addSubview:view];
        
        UILabel *lable = [[UILabel alloc] init];
        lable.textColor = [UIColor whiteColor];
        lable.font = [UIFont systemFontOfSize:15];
        [self.lableArray addObject:lable];
        [self.scrollView addSubview:lable];
        
        UIButton *button = [[UIButton alloc]init];
        [button addTarget:self action:@selector(click) forControlEvents:(UIControlEventTouchUpInside)];
        [self.buttonArray addObject:button];
        [self.scrollView addSubview:button];
        
    }
    //    self.currentPageIndex = 0;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    self.scrollView.frame = self.bounds;
    self.pageControl.frame = CGRectMake(CGRectGetWidth(self.frame)-10, CGRectGetHeight(self.frame)-30, 10,30);
    CGSize pointSize = [self.pageControl sizeForNumberOfPages:_imageUrls.count];
    
    if (!self.haveBottomView) {//无底部视图
        for (NSInteger i = 0; i < self.imageArray.count; i++) {
            
//            UIImageView *imageV = self.imageArray[i];
//            imageV.frame = CGRectMake(i * CGRectGetWidth(self.scrollView.frame), 0, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame));
            
            UILabel *lable = self.lableArray[i];
//            lable.frame = CGRectMake(i * CGRectGetWidth(self.scrollView.frame)+10, CGRectGetHeight(self.scrollView.frame)-30, CGRectGetWidth(self.scrollView.frame)-pointSize.width-10, 30);
            
            UIButton *button = self.buttonArray[i];
//            button.frame = CGRectMake(i * CGRectGetWidth(self.scrollView.frame), CGRectGetMaxY(self.scrollView.frame), CGRectGetWidth(self.scrollView.frame), 0);
            button.hidden = YES;
            
            UIView *view = self.viewArray[i];
//            view.frame = CGRectMake(i * CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame)-30, CGRectGetWidth(self.scrollView.frame), 30);
            
            
        }
    }
    else
    {
        for (NSInteger i = 0; i < self.imageArray.count; i++) {
//            UIImageView *imageV = self.imageArray[i];
//            imageV.frame = CGRectMake(i * CGRectGetWidth(self.scrollView.frame), 0, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame) - 20);
            
            UILabel *lable = self.lableArray[i];
//            lable.frame = CGRectMake(i * CGRectGetWidth(self.scrollView.frame)+10, CGRectGetHeight(self.scrollView.frame) - 20-30, CGRectGetWidth(self.scrollView.frame)-pointSize.width-10, 30);
            
            UIButton *button = self.buttonArray[i];
//            button.frame = CGRectMake(i * CGRectGetWidth(self.scrollView.frame), CGRectGetMaxY(self.scrollView.frame), CGRectGetWidth(self.scrollView.frame), 20);
            button.hidden = NO;
            
            UIView *view = self.viewArray[i];
//            view.frame = CGRectMake(i * CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame) - 20-30, CGRectGetWidth(self.scrollView.frame), 30);
            
        }
        
        
        
    }
}

- (void)setHaveBottomView:(BOOL)haveBottomView
{
    if (haveBottomView != self.haveBottomView) {
        self.haveBottomView = haveBottomView;
        [self setNeedsLayout];
    }
}

- (void)pageControlFrame:(CGRect)frame currentColor:(nonnull UIColor *)cColor nomalColor:(nonnull UIColor *)color;
{
    if (self.pageControl) {
        self.pageControl.frame = frame;
        [self setNeedsLayout];
        self.pageControl.currentPageIndicatorTintColor = cColor;
        self.pageControl.pageIndicatorTintColor = color;
    }
    
}
- (void)setImageUrls:(NSArray *)imageUrls
{
    _imageUrls = imageUrls;
    self.currentPageIndex = 0;
    self.totalPageCount = imageUrls.count;
    if (_imageUrls.count <= 1) {
        self.scrollView.scrollEnabled = NO;
        self.scrollView.contentOffset = CGPointMake(CGRectGetWidth(self.scrollView.frame), 0);
        self.scrollView.contentSize = CGSizeMake(3 * CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame));
        self.pageControl.hidden = YES;
    }
    else
    {
        // 这里必须为 3 否则向右轮播不了
        NSInteger index = 3;// imageUrls.count >=3 ?3:2;
        self.scrollView.scrollEnabled = YES;
        self.scrollView.contentOffset = CGPointMake(CGRectGetWidth(self.scrollView.frame), 0);
        self.scrollView.contentSize = CGSizeMake(index * CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame));
        self.pageControl.hidden = NO;
        self.pageControl.numberOfPages = _imageUrls.count;
        self.pageControl.currentPage = 0;
    }
    
    CGSize pointSize = [self.pageControl sizeForNumberOfPages:imageUrls.count];
    CGFloat page_x = -(self.pageControl.bounds.size.width - pointSize.width) /2;
    [self.pageControl setBounds:CGRectMake(page_x+5, self.pageControl.bounds.origin.y,0,self.pageControl.bounds.size.height)];
    
    [self updataImgs];
    
}
////这是为第二种添加的
//- (void)setImgs:(NSArray *)scrollimageUrls titleArr:(NSArray *)titleArr
//{
//    _imageUrls = imageUrls;
//    _titleStrArr = titleArr;
//    self.currentPageIndex = 0;
//    self.totalPageCount = imageUrls.count;
//    if (_imageUrls.count <= 1) {
//        self.scrollView.scrollEnabled = NO;
//        self.scrollView.contentOffset = CGPointMake(CGRectGetWidth(self.scrollView.frame), 0);
//        self.scrollView.contentSize = CGSizeMake(3 * CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame));
//        self.pageControl.hidden = YES;
//    }
//    else
//    {
//        // 这里必须为 3 否则向右轮播不了
//        NSInteger index = 3;// imageUrls.count >=3 ?3:2;
//        self.scrollView.scrollEnabled = YES;
//        self.scrollView.contentOffset = CGPointMake(CGRectGetWidth(self.scrollView.frame), 0);
//        self.scrollView.contentSize = CGSizeMake(index * CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame));
//        self.pageControl.hidden = NO;
//        self.pageControl.numberOfPages = _imageUrls.count;
//        self.pageControl.currentPage = 0;
//    }
//    [self updataImgs];
//
//}
//
/**
 *  更新图片以及位置
 */
- (void)updataImgs
{
    if (self.imageUrls == nil || self.imageUrls.count == 0) {
        return;
    }
    /**
     *  这里清除的图片信息
     */
    //    for (UIImageView *imageV in self.imageArray) {
    //        imageV.image = [UIImage imageNamed:@""];
    //    }
    // 这个index 是当前显示的图片在数组中的位置
    NSInteger centerIndex = self.currentPageIndex%3;
    self.pageControl.currentPage = _currentPageIndex;
    UIImageView *leftImgView = (UIImageView *)self.imageArray[(self.currentPageIndex - 1 + 3) % 3];
    UILabel *leftLable = (UILabel *)self.lableArray[(self.currentPageIndex - 1 + 3) % 3];
    UIView *leftView = (UIView *)self.viewArray[(self.currentPageIndex - 1 + 3) % 3];
    
    UIImageView *centerImgView = (UIImageView *)self.imageArray[centerIndex];
    UILabel *centerLable = (UILabel *)self.lableArray[centerIndex];
    UIView *centerView = (UIView *)self.viewArray[centerIndex];
    
    UIImageView *rightImgView = (UIImageView *)self.imageArray[(self.currentPageIndex + 1 ) % 3];
    UILabel *rightLable = (UILabel *)self.lableArray[(self.currentPageIndex + 1 ) % 3];
    UIView *rightView = (UIView *)self.viewArray[(self.currentPageIndex + 1 ) % 3];
    
    switch (self.imageUrls.count) {
        case 0:
            centerImgView.image = [UIImage imageNamed:_placeholderImageStr];
            break;
        case 1://一个 不需要 left 和 right
            //            [centerImgView setImageWithURL:[NSURL URLWithString:self.imageUrls[self.currentPageIndex]] placeholderImage:[UIImage imageNamed:_placeholderImageStr]];
        {
            NSString *imgUrlStr = self.imageUrls[self.currentPageIndex][@"url"];
            if (_smallImg) {
                imgUrlStr = [NSString stringWithFormat:@"%@%@",imgUrlStr,@"!.thumb"];
            }
            
            [centerImgView sd_setImageWithURL:[NSURL URLWithString:imgUrlStr] placeholderImage:[UIImage imageNamed:_placeholderImageStr]];
            centerLable.text = self.imageUrls[self.currentPageIndex][@"title"];
        }
            break;
        case 2: // 两个 不需要 rightimage
        {
            NSString *leftImgUrlStr = self.imageUrls[[self getValidNextPageIndexWithPageIndex:_currentPageIndex - 1]][@"url"];
            NSString *centerImgUrlStr = self.imageUrls[self.currentPageIndex][@"url"];
            if (_smallImg) {
                leftImgUrlStr = [NSString stringWithFormat:@"%@%@",leftImgUrlStr,@"!.thumb"];
                centerImgUrlStr = [NSString stringWithFormat:@"%@%@",centerImgUrlStr,@"!.thumb"];
            }
            //            NSString *leftUrl   = self.imageUrls[[self getValidNextPageIndexWithPageIndex:_currentPageIndex - 1]];
            //            NSString *centerUrl = self.imageUrls[self.currentPageIndex];
            //            NSString *rightUrl  = self.imageUrls[[self getValidNextPageIndexWithPageIndex:_currentPageIndex + 1]];
            
            [leftImgView sd_setImageWithURL:   [NSURL URLWithString:leftImgUrlStr] placeholderImage:[UIImage imageNamed:_placeholderImageStr]];
            [centerImgView sd_setImageWithURL: [NSURL URLWithString:centerImgUrlStr] placeholderImage:[UIImage imageNamed:_placeholderImageStr]];
            
            leftLable.text = self.imageUrls[[self getValidNextPageIndexWithPageIndex:_currentPageIndex - 1]][@"title"];
            centerLable.text = self.imageUrls[self.currentPageIndex][@"title"];
        }
            break;
            
        default:
        {
            NSString *leftImgUrlStr = self.imageUrls[[self getValidNextPageIndexWithPageIndex:_currentPageIndex - 1]][@"url"];
            NSString *centerImgUrlStr = self.imageUrls[self.currentPageIndex][@"url"];
            NSString *rightImgUrlStr  = self.imageUrls[[self getValidNextPageIndexWithPageIndex:_currentPageIndex + 1]][@"url"];
            
            if (_smallImg) {
                leftImgUrlStr = [NSString stringWithFormat:@"%@%@",leftImgUrlStr,@"!.thumb"];
                centerImgUrlStr = [NSString stringWithFormat:@"%@%@",centerImgUrlStr,@"!.thumb"];
                rightImgUrlStr = [NSString stringWithFormat:@"%@%@",centerImgUrlStr,@"!.thumb"];
            }
            //            NSString *leftUrl   = self.imageUrls[[self getValidNextPageIndexWithPageIndex:_currentPageIndex - 1]];
            //            NSString *centerUrl = self.imageUrls[self.currentPageIndex];
            //            NSString *rightUrl  = self.imageUrls[[self getValidNextPageIndexWithPageIndex:_currentPageIndex + 1]];
            
            [leftImgView sd_setImageWithURL:   [NSURL URLWithString:leftImgUrlStr] placeholderImage:[UIImage imageNamed:_placeholderImageStr]];
            [centerImgView sd_setImageWithURL: [NSURL URLWithString:centerImgUrlStr] placeholderImage:[UIImage imageNamed:_placeholderImageStr]];
            [rightImgView sd_setImageWithURL:  [NSURL URLWithString:rightImgUrlStr] placeholderImage:[UIImage imageNamed:_placeholderImageStr]];
            
            leftLable.text = self.imageUrls[[self getValidNextPageIndexWithPageIndex:_currentPageIndex - 1]][@"title"];
            centerLable.text = self.imageUrls[self.currentPageIndex][@"title"];
            rightLable.text = self.imageUrls[[self getValidNextPageIndexWithPageIndex:_currentPageIndex + 1]][@"title"];
        }
            break;
    }
    leftImgView.frame = CGRectMake(0, 0, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame));
    centerImgView.frame = CGRectMake(CGRectGetWidth(self.scrollView.frame), 0, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame));
    rightImgView.frame = CGRectMake(2*CGRectGetWidth(self.scrollView.frame), 0, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame));
    
    CGSize pointSize = [self.pageControl sizeForNumberOfPages:_imageUrls.count];
    leftLable.frame = CGRectMake(10, CGRectGetHeight(self.scrollView.frame)-30, kScreenWidth-pointSize.width-20, 30);
    centerLable.frame = CGRectMake(CGRectGetWidth(self.scrollView.frame)+10, CGRectGetHeight(self.scrollView.frame)-30, leftLable.width, 30);
    rightLable.frame = CGRectMake(2*CGRectGetWidth(self.scrollView.frame)+10, CGRectGetHeight(self.scrollView.frame)-30, leftLable.width, 30);
    
    leftView.frame = CGRectMake(0, CGRectGetHeight(self.scrollView.frame)-30, CGRectGetWidth(self.scrollView.frame), 30);
    centerView.frame = CGRectMake(CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame)-30, CGRectGetWidth(self.scrollView.frame), 30);
    rightView.frame = CGRectMake(2*CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame)-30, CGRectGetWidth(self.scrollView.frame), 30);
    
    //    if (_titleStrArr == nil || _titleStrArr.count == 0) {
    //        return;
    //    }
    
    
}

#pragma mark - 定时器
- (void)setIsAutoScrolling:(BOOL)isAutoScrolling
{
    _isAutoScrolling = isAutoScrolling;
    if (self.imageUrls == nil || self.imageUrls.count <= 1) {
        return;
    }
    _isAutoScrolling?[self.timer resumeTimer]:[self.timer pauseTimer];
}

-(void)setScrollingSpeed:(CGFloat)scrollingSpeed
{
    if (self.timer!=nil) {
        [self removeTimer];
        //        self.timer = nil;
        //         [self.timer invalidate];
        //        //[self.timer pauseTimer];
        // return;
    }
    if (self.imageUrls == nil || self.imageUrls.count <= 1) {
        return;
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:(_scrollingSpeed = scrollingSpeed)
                                                  target:self
                                                selector:@selector(timerDidFired:)
                                                userInfo:nil
                                                 repeats:YES];
    [self.timer pauseTimer];
}

- (void)timerDidFired:(NSTimer *)timer{
    
    CGPoint newOffset = CGPointMake(self.scrollView.contentOffset.x + CGRectGetWidth(self.scrollView.frame), self.scrollView.contentOffset.y);
    [self.scrollView setContentOffset:newOffset animated:YES];
}


#pragma mark - UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.timer pauseTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (self.isAutoScrolling)
    {
        [self.timer resumeTimerAfterTimeInterval:self.scrollingSpeed];
    }
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat contentOffsetX = scrollView.contentOffset.x;
    
    if (contentOffsetX <= 0.0) {
        self.currentPageIndex = [self getValidNextPageIndexWithPageIndex:self.currentPageIndex - 1];
        [self updataImgs];
        [self.scrollView setContentOffset:CGPointMake(CGRectGetWidth(self.scrollView.frame), 0) animated:NO];
    }
    else if (contentOffsetX >= (2 * CGRectGetWidth(scrollView.frame)))
    {
        self.currentPageIndex = [self getValidNextPageIndexWithPageIndex:self.currentPageIndex + 1];
        [self updataImgs];
        [self.scrollView setContentOffset:CGPointMake(CGRectGetWidth(self.scrollView.frame), 0) animated:NO];
    }
    //    NSLog(@"%ld",(long)_currentPageIndex);
}



- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [scrollView setContentOffset:CGPointMake(CGRectGetWidth(scrollView.frame), 0) animated:YES];
}


- (NSInteger)getValidNextPageIndexWithPageIndex:(NSInteger)currentPageIndex;
{
    if(currentPageIndex == -1) {
        return self.totalPageCount - 1;
    } else if (currentPageIndex == self.totalPageCount) {
        return 0;
    } else {
        return currentPageIndex;
    }
}
#pragma 点击
- (void)click
{
    
    if (self.cycleClickBlock && self.imageUrls.count >1) {
        self.cycleClickBlock(self.currentPageIndex);
    }
    
}


-(void)resumeTimer
{
    if (self.timer == nil) {
        [self setScrollingSpeed:_scrollingSpeed];
    }
    if (self.timer != nil && self.timer.isValid && self.isAutoScrolling) {
        [self.timer resumeTimerAfterTimeInterval:self.scrollingSpeed];
        
    }
    
}

-(void)pauseTimer
{
    if (self.timer != nil && self.timer.isValid) {
        [self.timer pauseTimer];
        
    }
}

- (void)removeTimer
{
    if (self.timer == nil) {
        return;
    }
    [self.timer invalidate];
    self.timer = nil;
}









/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
