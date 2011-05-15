/*
 *  CDRangeTest.m
 *  CodingDojo
 */

#import <SenTestingKit/SenTestingKit.h>

#import "CDRange.h"



@interface CDRangeTest : SenTestCase
{
}
@end



// Some of the assertions provided by SenTestingKit
// STAssertNil(a1, description, ...)
// STAssertNotNil(a1, description, ...)
// STAssertTrue(expression, description, ...)
// STAssertFalse(expression, description, ...)
// STAssertEqualObjects(a1, a2, description, ...)
// STAssertEquals(a1, a2, description, ...)
// STAssertEqualsWithAccuracy(left, right, accuracy, description, ...)
// STAssertThrows(expression, description, ...)
// STAssertThrowsSpecific(expression, specificException, description, ...)
// STAssertThrowsSpecificNamed(expr, specificException, aName, description, ...)
// STAssertNoThrow(expression, description, ...)
// STAssertNoThrowSpecific(expression, specificException, description, ...)
// STAssertNoThrowSpecificNamed(expr, specificException, aName, description, ...)
// STFail(description, ...)
// STAssertTrueNoThrow(expression, description, ...)
// STAssertFalseNoThrow(expression, description, ...)


@implementation CDRangeTest

- (void)testCDRangeTypeShouldExist
{
  CDRange range;
}

- (void)testCDRangeShouldHaveLocationMember
{
  CDRange range;
  range.location;
}

- (void)testCDRangeShouldHaveLengthMember
{
  CDRange range;
  range.length;
}

- (void)testCDMakeRangeShouldCreateARangeWithGivenLocation
{
  CDRange range = CDMakeRange(123, 456);
  
  STAssertEquals(123U, range.location, nil);
}

- (void)testCDMakeRangeShouldCreateARangeWithGivenLength
{
  CDRange range = CDMakeRange(123, 456);
  
  STAssertEquals(456U, range.length, nil);
}

- (void)testCDMaxRangeShouldReturnTheSumOfLocationAndLength
{
  CDRange range = CDMakeRange(123, 456);
  
  STAssertEquals(579U, CDMaxRange(range), nil);
}

- (void)testCDEqualRangesShouldReturnYESWhenComparingWithItself
{
  CDRange range = CDMakeRange(123, 456);
  
  STAssertTrue(CDEqualRanges(range, range), nil);
}

- (void)testCDEqualRangesShouldReturnYESWhenComparingTwoEqualRanges
{
  CDRange range1 = CDMakeRange(123, 456);
  CDRange range2 = CDMakeRange(123, 456);
  
  STAssertTrue(CDEqualRanges(range1, range2), nil);
}

- (void)testCDEqualRangesShouldReturnNOWhenComparingDifferentRanges
{
  CDRange range1 = CDMakeRange(123, 456);
  CDRange range2 = CDMakeRange(789, 321);
  
  STAssertFalse(CDEqualRanges(range1, range2), nil);
}

- (void)testCDLocationInRangeShouldReturnYESForRangePosition
{
  CDRange range = CDMakeRange(123, 456);
  
  STAssertTrue(CDLocationInRange(123, range), nil);
}

- (void)testCDLocationInRangeShouldReturnYESForLocationsBetweenRangeLocationAndLength
{
  CDRange range = CDMakeRange(123, 10);
  
  STAssertTrue(CDLocationInRange(128, range), nil);
}

- (void)testCDLocationInRangeShouldReturnNOForLocationsOutsideTheRange
{
  CDRange range = CDMakeRange(123, 10);
  
  STAssertFalse(CDLocationInRange(122, range), nil);
}

- (void)testCDLocationInRangeShouldReturnYESForLastLocationInRange
{
  CDRange range = CDMakeRange(123, 10);
  
  STAssertTrue(CDLocationInRange(132, range), nil);
}

- (void)testCDLocationInRangeShouldReturnNOForFirstLocationOutsideRange
{
  CDRange range = CDMakeRange(123, 10);
  
  STAssertFalse(CDLocationInRange(133, range), nil);
}

- (void)testCDLocationInRangeShouldReturnNOForAnythingInRangeOfLengthZero
{
  CDRange range = CDMakeRange(123, 0);
  
  STAssertFalse(CDLocationInRange(123, range), nil);
}

- (void)testCDStringFromRangeShouldReturnTheStringRepresentationOfTheRange
{
  CDRange range = CDMakeRange(123, 456);
  
  STAssertEqualObjects(@"{123, 456}", CDStringFromRange(range), nil);
}

@end
