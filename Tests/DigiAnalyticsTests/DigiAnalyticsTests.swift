import XCTest
@testable import DigiAnalytics

final class DigiAnalyticsTests: XCTestCase {
    
    override func setUp() {
        // Log
        print("Setting up test...")
        
        // Set base URL
        DigiAnalytics.shared.baseURL = "https://test.nathanfallet.me/"
    }
    
    func testRequest(path: String) {
        // Test to send a request to API
        let expectation = XCTestExpectation(description: "Send request")
        
        // Print debug information
        print("User-Agent: \(Device.userAgent)")
        
        // Send the request
        DigiAnalytics.shared.send(path: path) { status in
            // Check status
            XCTAssertTrue(status == .ok, "Request failed with status \(status)")
            
            // Done
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testRequest1() {
        testRequest(path: "testRequest1")
    }
    
    func testRequest2() {
        testRequest(path: "testRequest2")
    }

    static var allTests = [
        ("testRequest1", testRequest1),
        ("testRequest2", testRequest2),
    ]
}
