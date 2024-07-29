//
//  NetworkModelTests.swift
//  DragonBallWikiTests
//
//  Created by Marc Navarro on 26/7/24.
//

import XCTest
@testable import DragonBallWiki

final class NetworkModelTests: XCTestCase {
    
    // MARK: - SUT
    private var sut: NetworkModel!
    
    // MARK: - Case States
    override func setUp() {
        super.setUp()
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: configuration)
        sut = NetworkModel(session: session)
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    // MARK: - Login Test
    func testLogin() {
        let expectedToken = "Some token"
        let someUser = "SomeUser"
        let somePassword = "SomePassword"
        
        MockURLProtocol.requestHandler = { request in
            let longString = String(format: "%@:%@", someUser, somePassword)
            let loginData = longString.data(using: .utf8)!
            let base64LognString = loginData.base64EncodedString()
            
            XCTAssertEqual(request.httpMethod, "POST")
            XCTAssertEqual(request.value(
                forHTTPHeaderField: "Authorization"),
                "Basic \(base64LognString)"
            )
            
            let data = try XCTUnwrap(expectedToken.data(using:.utf8))
            let response = try XCTUnwrap(
                HTTPURLResponse(
                    url: URL(string: "https://dragonball.keepcoding.education")!,
                    statusCode: 200,
                    httpVersion: nil,
                    headerFields: ["Content-Type": "application/json"]
                )
            )
            
            return (response, data)
        }
        
        let expectation = expectation(description: "Login succsess")
        
        sut.login(
            user: someUser,
            password: somePassword
        ) { result in
            guard case let .success(token) = result else {
                XCTFail("Expected success but recieved \(result)")
                return
            }
            
            XCTAssertEqual(token, expectedToken)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    // MARK: - Get Heroes Test
    func testGetHeroes() {
        let expectedData : [Hero] = []
        let token = "Some token"
        sut.setToken(value: token)
        
        MockURLProtocol.requestHandler = { request in
            XCTAssertEqual(request.httpMethod, "POST")
            XCTAssertEqual(request.value(
                forHTTPHeaderField: "Authorization"),
                "Bearer \(token)"
            )
            
            let data = try XCTUnwrap(expectedData.description.data(using:.utf8))
            let response = try XCTUnwrap(
                HTTPURLResponse(
                    url: URL(string: "https://dragonball.keepcoding.education")!,
                    statusCode: 200,
                    httpVersion: nil,
                    headerFields: ["Content-Type": "application/json"]
                )
            )
            
            return (response, data)
        }
        
        let expectation = expectation(description: "Data recieved")
        
        sut.getHeroes() { result in
            guard case let .success(resource) = result else {
                XCTFail("Expected success but recieved \(result)")
                return
            }
            
            XCTAssertEqual(resource, expectedData)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    // MARK: - Get Transformations Test
    func testGetTransformations() {
        let expectedData : [Transformation] = []
        let someHero: Hero = Hero(
            id: "Some ID",
            favorite: false,
            name: "Some name",
            photo: URL(string: "https://someURL.com")!,
            description: "Some description"
        )
        let token = "Some token"
        sut.setToken(value: token)
        
        MockURLProtocol.requestHandler = { request in
            XCTAssertEqual(request.httpMethod, "POST")
            XCTAssertEqual(request.value(
                forHTTPHeaderField: "Authorization"),
                "Bearer \(token)"
            )
            
            let data = try XCTUnwrap(expectedData.description.data(using:.utf8))
            let response = try XCTUnwrap(
                HTTPURLResponse(
                    url: URL(string: "https://dragonball.keepcoding.education")!,
                    statusCode: 200,
                    httpVersion: nil,
                    headerFields: ["Content-Type": "application/json"]
                )
            )
            
            return (response, data)
        }
        
        let expectation = expectation(description: "Data recieved")
        
        sut.getTransformations(
            for: someHero
        ) { result in
            guard case let .success(resource) = result else {
                XCTFail("Expected success but recieved \(result)")
                return
            }
            
            XCTAssertEqual(resource, expectedData)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
}

// MARK: - Mock Protocol
final class MockURLProtocol: URLProtocol {
    static var error: NetworkModel.NetworkError?
    static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data))?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if let error = MockURLProtocol.error {
            client?.urlProtocol(self, didFailWithError: error)
            return
        }
        
        guard let handler = MockURLProtocol.requestHandler else {
            assertionFailure("Recieved unexpected request with no handler")
            return
        }
        
        do {
            let (response, data) = try handler(request)
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: data)
            client?.urlProtocolDidFinishLoading(self)
        } catch {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }
    
    override func stopLoading() { }
}
