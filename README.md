bookie
======

[![BuddyBuild][bb-badge]][bb-link]

[bb-badge]: https://dashboard.buddybuild.com/api/statusImage?appID=5927b7083d920000012f78f3&branch=master&build=latest
[bb-link]: https://dashboard.buddybuild.com/apps/5927b7083d920000012f78f3/build/latest?branch=master

A CoreData demo app with Fabric analytics integration
and [unit, integration, and UI tests][tests] written in XCTest.

[tests]: https://github.com/jkrmr/bookie/tree/master/CoreDataHotelTests

```text
All tests
Test Suite CoreDataHotelUITests.xctest started
CoreDataHotelUITests
    ✓ testUserCanBookAReservation (18.296 seconds)

  Executed 1 test, with 0 failures (0 unexpected) in 18.296 (18.298) seconds

All tests
Test Suite CoreDataHotelTests.xctest started
Hotel_ComparisonUtilsTests
    ✓ testCompareComparesByHotelNameAscending (0.004 seconds)
    ✓ testCompareComparesByHotelNameDescending (0.002 seconds)
    ✓ testCompareComparesByHotelNameSame (0.001 seconds)
Hotel_SummaryTest
    ✓ testSummaryIncludesStars (0.001 seconds)
ReservationQueryTest
    ✓ testAllReservationsCorrectlyReturnsASingleReservation (0.002 seconds)
    ✓ testAllReservationsReturnsMultipleReservations (0.001 seconds)
    ✓ testReservationsWithGuestDetailsFindsByExactOrPartialMatch (0.004 seconds)
Reservation_SummaryTest
    ✓ testSummaryIncludesBookingDates (0.002 seconds)
RoomQueryTest
    ✓ testAvailableOnDaysFromReturnsAValidRequest (0.002 seconds)
Room_ComparisonUtilsTests
    ✓ testCompareComparesByRoomNumberAscending (0.001 seconds)
    ✓ testCompareComparesByRoomNumberDescending (0.001 seconds)
    ✓ testCompareComparesByRoomNumberSame (0.001 seconds)


  Executed 12 tests, with 0 failures (0 unexpected) in 0.022 (0.028) seconds
```
