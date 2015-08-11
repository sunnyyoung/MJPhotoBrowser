//
//  CollectionViewController.m
//  MJPhotoBrowser
//
//  Created by Sunnyyoung on 15/5/22.
//  Copyright (c) 2015年 Sunnyyoung. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"
#import "MJPhotoBrowser.h"

static NSString * const reuseIdentifier = @"Cell";

@interface CollectionViewController ()

@property (nonatomic, strong) NSArray *imageURLArray;

@end

@implementation CollectionViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _imageURLArray = @[@"http://h.hiphotos.baidu.com/image/pic/item/b8389b504fc2d5628a2690ece51190ef76c66c80.jpg",
                           @"http://g.hiphotos.baidu.com/image/pic/item/1ad5ad6eddc451da6709d67ab5fd5266d11632a0.jpg",
                           @"http://b.hiphotos.baidu.com/image/pic/item/908fa0ec08fa513def983c7f3e6d55fbb2fbd965.jpg",
                           @"http://f.hiphotos.baidu.com/image/pic/item/32fa828ba61ea8d398b30a7d950a304e251f5831.jpg",
                           @"http://a.hiphotos.baidu.com/image/w%3D230/sign=525711e6a60f4bfb8cd09957334e788f/1e30e924b899a9019c5d254f1f950a7b0208f55b.jpg",
                           @"http://e.hiphotos.baidu.com/image/pic/item/c83d70cf3bc79f3d8c709a49b8a1cd11728b2931.jpg",
                           @"http://b.hiphotos.baidu.com/image/w%3D230/sign=87da5b715143fbf2c52ca120807fca1e/77c6a7efce1b9d16bc7ce418f1deb48f8c54640b.jpg",
                           @"http://h.hiphotos.baidu.com/image/pic/item/a71ea8d3fd1f4134f08c7b07271f95cad1c85e0b.jpg",
                           @"http://g.hiphotos.baidu.com/image/pic/item/adaf2edda3cc7cd9c3b328cd3b01213fb80e9103.jpg"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _imageURLArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:_imageURLArray[indexPath.row]]];
    return cell;
}

#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = 0;
    NSMutableArray *photoArray = [NSMutableArray array];
    MJPhotoBrowser *photoBrowser = [[MJPhotoBrowser alloc] init];
    for (NSString *imageURL in _imageURLArray) {
        MJPhoto *photo = ({
            MJPhoto *photo = [[MJPhoto alloc] init];
            photo.url = [NSURL URLWithString:imageURL];
            photo.srcImageView = ((CollectionViewCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0]]).imageView;
            photo;
        });
        row++;
        [photoArray addObject:photo];
    }
    photoBrowser.photos = photoArray;
    photoBrowser.currentPhotoIndex = indexPath.row;
    [photoBrowser show];
}

@end
