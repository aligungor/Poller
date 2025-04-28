import Foundation
import Combine

// MARK: - Protocol
public protocol PollerProtocol {
    var publisher: AnyPublisher<Void, Never> { get }
    func start()
    func stop()
}

// MARK: - Class
open class Poller: PollerProtocol {
    // MARK: - Variables
    private var timerSubscription: AnyCancellable?
    private let interval: TimeInterval
    private let fireImmediately: Bool
    private let subject = PassthroughSubject<Void, Never>()

    public var publisher: AnyPublisher<Void, Never> {
        subject.eraseToAnyPublisher()
    }

    // MARK: - Lifecycle
    public init(interval: TimeInterval, fireImmediately: Bool = false) {
        precondition(interval > 0, "Interval must be greater than 0 seconds.")
        self.interval = interval
        self.fireImmediately = fireImmediately
    }

    // MARK: - Protocol Implementation
    open func start() {
        if fireImmediately {
            subject.send(())
        }

        timerSubscription = Timer
            .publish(every: interval, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.subject.send(())
            }
    }

    open func stop() {
        timerSubscription?.cancel()
        timerSubscription = nil
    }
}
