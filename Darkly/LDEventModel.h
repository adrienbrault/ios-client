//
//  LDEventModel.h
//  Darkly
//
//  Created by Jeffrey Byrnes on 1/18/16.
//  Copyright © 2016 Darkly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LDEventModel : NSObject <NSCoding>
@property (nullable, nonatomic, strong) NSString *key;
@property (nullable, nonatomic, strong) NSString *kind;
@property (nonatomic) NSInteger creationDate;
@property (nullable, nonatomic, strong) NSDictionary *data;

@property (nonatomic, assign) BOOL featureKeyValue;
@property (nonatomic, assign) BOOL isDefault;

- (nonnull id)initWithDictionary:(NSDictionary * __nonnull)dictionary;

-(nonnull instancetype)featureEventWithKey:(nonnull NSString *)featureKey keyValue:(BOOL)keyValue defaultKeyValue:(BOOL)defaultKeyValue;
-(nonnull instancetype) customEventWithKey: (nonnull NSString *)featureKey
                         andDataDictionary: (nonnull NSDictionary *)customData;
@end
