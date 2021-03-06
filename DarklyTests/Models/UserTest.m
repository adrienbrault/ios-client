//
//  Copyright © 2015 Catamorphic Co. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LDUser.h"

@interface UserTest : XCTestCase
@end

@implementation UserTest
- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testAnonymousSetToFalseIfKeySet {
    LDUser *user = [[LDUser alloc] init];
    
    user.key = @"aUser";
    
    XCTAssertFalse(user.anonymous);
}

-(void)testNillValuesExcluded {
    LDUser *user = [[LDUser alloc] init];
    
    user.key = @"aUser";
    user.email = @"gus@byrnesinnovation.com";
    
    NSDictionary *nonNilValues = user.dictionaryValue;
    
    XCTAssertFalse([[nonNilValues allKeys] containsObject: @"firstName"]);
    
    user.firstName = @"Billy";
    nonNilValues = user.dictionaryValue;
    
    XCTAssertTrue([[nonNilValues allKeys] containsObject: @"firstName"]);
}

-(void) testSettingUserKeyToNilOrBlank {
    LDUser *user = [[LDUser alloc] init];
    
    user.key = @"aUser";
    XCTAssertFalse(user.anonymous);
    
    user.key = nil;
    XCTAssertTrue(user.anonymous);
    XCTAssertNotNil(user.key);

    user.key = @"";
    XCTAssertTrue(user.anonymous);
    XCTAssertNotNil(user.key);
    
    user.key = @"notNil";
    XCTAssertFalse(user.anonymous);
    XCTAssertNotNil(user.key);

}

@end
