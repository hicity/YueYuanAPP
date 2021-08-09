//
//  LZBBaseTabBarController.m
//  LZBProject
//
//  Created by hicity on 2019/10/21.
//  Copyright © 2019 hicity. All rights reserved.
//

#import "LZBBaseTabBarController.h"
#import "LZBBaseNavigationController.h"

#define KStoryBoardHomeVC    @"First"
#define KStoryBoardCTBVC     @"Second"
#define KSroryBoardMineVC    @"Third"

#define KStoryBoardHomeVCTitle    @"第一个"
#define KStoryBoardCTBVCTitle     @"第二个"
#define KSroryBoardMineVCTitle    @"第三个"

@interface LZBBaseTabBarController () <UINavigationControllerDelegate, LZB_TabBarDelegate>

@property (nonatomic, strong) NSMutableArray *normalImageArray;

@property (nonatomic, strong) NSMutableArray *selectedImageArray;

@property (nonatomic, strong) NSMutableArray *tabBarConfsArray;

@property (nonatomic, strong) NSArray        *controllerIdentiferArray;

@property (nonatomic, strong) NSArray        *itemZizeArray;

@property (nonatomic, strong) NSArray        *tabbarTitleArr;

@end

@implementation LZBBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self confgiSubControllers];
    [self configTabbar];
    // Do any additional setup after loading the view.
}

- (void)confgiSubControllers {
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    self.tabBarConfsArray = @[].mutableCopy;
    
    __weak typeof(self) weakSelf = self;;
    [self.controllerIdentiferArray enumerateObjectsUsingBlock:^(NSString *identifier, NSUInteger idx, BOOL * _Nonnull stop) {
        
        LZBBaseNavigationController *navi = [self navigationControllerWithIdentifier:identifier];
        navi.delegate = self;
        [arr addObject:navi];
        
        LZB_TabBarConfigModel *model = [LZB_TabBarConfigModel new];
        
        model.itemTitle       = weakSelf.tabbarTitleArr[idx];
        model.normalImageName = weakSelf.normalImageArray[idx];
        model.selectImageName = weakSelf.selectedImageArray[idx];
        model.itemBadgeStyle = LZB_TabBarItemBadgeStyleTopRight;
        if (idx == 1) {
            model.itemLayoutStyle = LZB_TabBarItemLayoutStylePicture;
        }
        model.selectColor = [UIColor redColor];
        model.normalColor = KMAINFFFF;
        model.pictureWordsMargin = 0;
        model.normalBackgroundColor = [UIColor clearColor];
        model.backgroundImageView.image = IMAGE_NAMED(@"tabbar_iconbg_homepage");
        
        [self.tabBarConfsArray addObject:model];
        
    }];
    self.viewControllers = arr;
}

- (void)configTabbar {
    
    self.lzbTabBar = [[LZB_TabBar alloc] init];
    
    self.lzbTabBar.backgroundImageView.image = [WHGradientHelper getLinearGradientImage:[UIColor colorWithHex:@"#018C6D"]
              and:[UIColor colorWithHex:@"#00A26D"]
    directionType:WHLinearGradientDirectionLevel];
    self.lzbTabBar.tabBarConfig = self.tabBarConfsArray;
    // 7.设置委托
    self.lzbTabBar.delegate = self;
    // 8.添加覆盖到上边
    [self.tabBar addSubview:self.lzbTabBar];
    [self addLayoutTabBar]; // 10.添加适配
}

// 9.实现代理，如下：
- (void)LZB_TabBar:(LZB_TabBar *)tabbar selectIndex:(NSInteger)index {
    // 通知 切换视图控制器
    [self setSelectedIndex:index];
//    [tabbar setBadge:[NSString stringWithFormat:@"%d",arc4random()%100] index:1];
    // 自定义的AE_TabBar回调点击事件给TabBarVC，TabBarVC用父类的TabBarController函数完成切换
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    [super setSelectedIndex:selectedIndex];
    if(self.lzbTabBar){
        self.lzbTabBar.selectIndex = selectedIndex;
        
    }
}

// 10.添加适配
- (void)addLayoutTabBar {
    // 使用重载viewDidLayoutSubviews实时计算坐标 （下边的 -viewDidLayoutSubviews 函数）
    // 能兼容转屏时的自动布局
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.lzbTabBar.frame = self.tabBar.bounds;
    [self.lzbTabBar viewDidLayoutItems];
}

- (LZBBaseNavigationController *)navigationControllerWithIdentifier:(NSString *)identifier {
    LZBBaseNavigationController *nav = [[UIStoryboard storyboardWithName:identifier bundle:nil] instantiateInitialViewController];
    return nav;
}

- (NSArray *)controllerIdentiferArray {
    if (!_controllerIdentiferArray) {
        _controllerIdentiferArray = @[KStoryBoardHomeVC, KStoryBoardCTBVC, KSroryBoardMineVC];
    }
    return _controllerIdentiferArray;
}

- (NSArray *)itemZizeArray {
    if (!_itemZizeArray) {
        _itemZizeArray = @[[NSValue valueWithCGSize:CGSizeMake(40, 40)],
                           [NSValue valueWithCGSize:CGSizeMake(40, 40)],
                           [NSValue valueWithCGSize:CGSizeMake(50, 40)],
                           [NSValue valueWithCGSize:CGSizeMake(60, 40)]];
    }
    return _itemZizeArray;
}

- (NSArray *)tabbarTitleArr {
    if (!_tabbarTitleArr) {
        _tabbarTitleArr = @[KStoryBoardHomeVCTitle,KStoryBoardCTBVCTitle,KSroryBoardMineVCTitle];
    }
    return _tabbarTitleArr;
}

- (NSMutableArray *)normalImageArray {
    if (!_normalImageArray) {
        _normalImageArray = [[NSMutableArray alloc] initWithObjects:@"home_nor", @"mo_ni_nor", @"stock_nor", nil];
    }
    return _normalImageArray;
}

- (NSMutableArray *)selectedImageArray {
    if (!_selectedImageArray) {
        _selectedImageArray = [[NSMutableArray alloc] initWithObjects:@"home_sel", @"mo_ni_sel", @"stock_sel", nil];
    }
    return _selectedImageArray;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
