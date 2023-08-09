//
//  CurrentWeatherTests.swift
//  CurrentWeatherTests
//
//  Created by Ivan on 09.08.2023.
//

import XCTest
import LocationProvider
import NetworkProvider
@testable import Common
@testable import CurrentWeather

final class CurrentWeatherTests: XCTestCase {
    
    private var networkManager: NetworkServiceMock!
    private var currentWeatherViewModel: CurrentWeatherViewModel!
    
    override func setUpWithError() throws {
        networkManager = NetworkServiceMock()
        currentWeatherViewModel = CurrentWeatherViewModel(weatherService: WeatherService(networkService: networkManager, locationService: CoreLocationManager()))
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        networkManager = nil
        currentWeatherViewModel = nil
        try super.tearDownWithError()
    }
    
    private func getResponseMock() -> CurrentWeather {
        return CurrentWeather(dt: Date(),
                              name: "test",
                              timezone: 1,
                              weather: [],
                              main: CurrentWeather.Main(temp: 1,
                                                        feelsLike: 1,
                                                        tempMin: 1,
                                                        tempMax: 1,
                                                        pressure: 1,
                                                        humidity: 1),
                              sys: CurrentWeather.Sys(country: "test",
                                                      sunrinse: nil,
                                                      sunset: nil),
                              wind: CurrentWeather.Wind(speed: 1)
        )
    }
    
    func testSccesWeatherFetch() {
        // Arrange
        let expectation = XCTestExpectation(description: "Succes fetch expectation")
        let mockResponse = getResponseMock()
        
        XCTAssertEqual(currentWeatherViewModel.networkState, .idle)
        
        // Act
        currentWeatherViewModel.fetchWeather()

        // Assert
        XCTAssertEqual(currentWeatherViewModel.networkState, .loading)
        XCTAssertEqual(networkManager.requestCalled, true)
        
        networkManager.requestRecievedArguments?.completion(.success(mockResponse))
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            XCTAssertEqual(self.currentWeatherViewModel.networkState, .success(mockResponse))
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testErrorWeatherFetch() {
        // Arrange
        let expectation = XCTestExpectation(description: "testing expectation")
        let mockError = AppError()
        
        XCTAssertEqual(currentWeatherViewModel.networkState, .idle)

        // Act
        currentWeatherViewModel.fetchWeather()

        // Assert
        XCTAssertEqual(currentWeatherViewModel.networkState, .loading)
        XCTAssertEqual(networkManager.requestCalled, true)
        
        networkManager.requestRecievedArguments?.completion(.failure(mockError))

        DispatchQueue.main.asyncAfter(deadline: .now()) {
            XCTAssertEqual(self.currentWeatherViewModel.networkState, .error("Не удалось завершить операцию. (CurrentWeatherTests.AppError, ошибка 1)"))
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
}
