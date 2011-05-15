/*
 *  CDRange.h
 *  CodingDojo
 */

#import <Foundation/Foundation.h>

typedef struct _CDRange {
  NSUInteger location;
  NSUInteger length;
} CDRange;

CDRange CDMakeRange(NSUInteger location, NSUInteger length);

NSUInteger CDMaxRange(CDRange range);

BOOL CDEqualRanges(CDRange range1, CDRange range2);

BOOL CDLocationInRange(NSUInteger location, CDRange range);

NSString *CDStringFromRange(CDRange range);