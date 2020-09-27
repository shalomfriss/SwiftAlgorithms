//
//  RegexMatchingTests.swift
//  SwiftAlgorithmsTests
//
//  Created by Shalom Friss on 7/18/20.
//  Copyright © 2020 Shalom Friss. All rights reserved.
//

import XCTest
@testable import SwiftAlgorithms

class RegexMatchingTests: XCTestCase {
    var matcher = RegexMatching()
    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }
    
    func testRegularMatch() {
        XCTAssertTrue(matcher.match("abcd", "abcd"))
        XCTAssertTrue(matcher.match("abc123", "abc123"))
        XCTAssertTrue(matcher.match("aaaaa", "aaaaa"))
        XCTAssertTrue(matcher.match("bbbaaammm", "bbbaaammm"))
        XCTAssertTrue(matcher.match("ASDFasdf", "ASDFasdf"))
        XCTAssertTrue(matcher.match("xxxxxxxxxxxxxxx", "xxxxxxxxxxxxxxx"))
        
        XCTAssertFalse(matcher.match("abcd", "abcdd"))
        XCTAssertFalse(matcher.match("abc123", "abc12"))
        XCTAssertFalse(matcher.match("aaaaa", "aaabaa"))
        XCTAssertFalse(matcher.match("bbbaaammm", "bbaaamm"))
        XCTAssertFalse(matcher.match("ASDFasdf", "ASDxFasdf"))
        XCTAssertFalse(matcher.match("xxxxxxxxxxxxxxx", "xxxxxxxxxxxxxxxx"))
    }
    
    func testDotMatch() {
        XCTAssertTrue(matcher.match("abbde", "ab..e"))
        XCTAssertTrue(matcher.match("abbde", "....."))
        XCTAssertFalse(matcher.match("abbde", "...."))
    }
    
    func testStarMatch() throws {
        self.measure {
            XCTAssertTrue(matcher.match("aac", ".*"))
            XCTAssertTrue(matcher.match("aac", ".*"))
            XCTAssertTrue(matcher.match("aac", "aa.*"))
            XCTAssertTrue(matcher.match("asdfkj", ".*"))
            XCTAssertTrue(matcher.match("aabcc", "aab*cc"))
            XCTAssertTrue(matcher.match("aabbbbbbcc", "aab*cc"))
            XCTAssertTrue(matcher.match("aacc", "aab*cc"))
            
            XCTAssertFalse(matcher.match("acc", "aab*cc"))
            
            XCTAssertTrue(matcher.match("aa", "a*"))
        }
        
    }
    
    func testTiming() {
        self.measure {
            XCTAssertTrue(matcher.match("abcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl23423423422222222mnopqrstuvwxyz", "abcdefghiujkl23423423422222222mnopqrstuvwxyzabcdefghiujkl2342.*z"))
        }
    }


}
