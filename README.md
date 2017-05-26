bookie
======

A CoreData demo app with Fabric analytics integration
and [unit, integration, and UI tests][tests] written in XCTest.

[tests]: https://github.com/jkrmr/bookie/tree/master/CoreDataHotelTests

```text
Test Suite 'All tests' started at 2017-05-26 00:15:07.716

Test Suite 'CoreDataHotelTests.xctest' started at 2017-05-26 00:15:07.716

Test Suite 'Hotel_ComparisonUtilsTests' started at 2017-05-26 00:15:07.716
Test Case '-[Hotel_ComparisonUtilsTests testCompareComparesByHotelNameAscending]' started.
Test Case '-[Hotel_ComparisonUtilsTests testCompareComparesByHotelNameAscending]' passed (0.005 seconds).
Test Case '-[Hotel_ComparisonUtilsTests testCompareComparesByHotelNameDescending]' started.
Test Case '-[Hotel_ComparisonUtilsTests testCompareComparesByHotelNameDescending]' passed (0.002 seconds).
Test Case '-[Hotel_ComparisonUtilsTests testCompareComparesByHotelNameSame]' started.
Test Case '-[Hotel_ComparisonUtilsTests testCompareComparesByHotelNameSame]' passed (0.002 seconds).
Test Suite 'Hotel_ComparisonUtilsTests' passed at 2017-05-26 00:15:07.725.
	 Executed 3 tests, with 0 failures (0 unexpected) in 0.008 (0.009) seconds

Test Suite 'Hotel_SummaryTest' started at 2017-05-26 00:15:07.726
Test Case '-[Hotel_SummaryTest testSummaryIncludesStars]' started.
Test Case '-[Hotel_SummaryTest testSummaryIncludesStars]' passed (0.002 seconds).
Test Suite 'Hotel_SummaryTest' passed at 2017-05-26 00:15:07.728.
	 Executed 1 test, with 0 failures (0 unexpected) in 0.002 (0.002) seconds

Test Suite 'ReservationQueryTest' started at 2017-05-26 00:15:07.728
Test Case '-[ReservationQueryTest testAllReservationsCorrectlyReturnsASingleReservation]' started.
Test Case '-[ReservationQueryTest testAllReservationsCorrectlyReturnsASingleReservation]' passed (0.003 seconds).
Test Case '-[ReservationQueryTest testAllReservationsReturnsMultipleReservations]' started.
Test Case '-[ReservationQueryTest testAllReservationsReturnsMultipleReservations]' passed (0.002 seconds).
Test Case '-[ReservationQueryTest testReservationsWithGuestDetailsFindsByExactOrPartialMatch]' started.
Test Case '-[ReservationQueryTest testReservationsWithGuestDetailsFindsByExactOrPartialMatch]' passed (0.005 seconds).
Test Suite 'ReservationQueryTest' passed at 2017-05-26 00:15:07.739.
	 Executed 3 tests, with 0 failures (0 unexpected) in 0.010 (0.011) seconds

Test Suite 'Reservation_SummaryTest' started at 2017-05-26 00:15:07.739
Test Case '-[Reservation_SummaryTest testSummaryIncludesBookingDates]' started.
Test Case '-[Reservation_SummaryTest testSummaryIncludesBookingDates]' passed (0.003 seconds).
Test Suite 'Reservation_SummaryTest' passed at 2017-05-26 00:15:07.743.
	 Executed 1 test, with 0 failures (0 unexpected) in 0.003 (0.004) seconds

Test Suite 'RoomQueryTest' started at 2017-05-26 00:15:07.743
Test Case '-[RoomQueryTest testAvailableOnDaysFromReturnsAValidRequest]' started.
Test Case '-[RoomQueryTest testAvailableOnDaysFromReturnsAValidRequest]' passed (0.003 seconds).
Test Suite 'RoomQueryTest' passed at 2017-05-26 00:15:07.746.
	 Executed 1 test, with 0 failures (0 unexpected) in 0.003 (0.003) seconds

Test Suite 'Room_ComparisonUtilsTests' started at 2017-05-26 00:15:07.747
Test Case '-[Room_ComparisonUtilsTests testCompareComparesByRoomNumberAscending]' started.
Test Case '-[Room_ComparisonUtilsTests testCompareComparesByRoomNumberAscending]' passed (0.002 seconds).
Test Case '-[Room_ComparisonUtilsTests testCompareComparesByRoomNumberDescending]' started.
Test Case '-[Room_ComparisonUtilsTests testCompareComparesByRoomNumberDescending]' passed (0.002 seconds).
Test Case '-[Room_ComparisonUtilsTests testCompareComparesByRoomNumberSame]' started.
Test Case '-[Room_ComparisonUtilsTests testCompareComparesByRoomNumberSame]' passed (0.002 seconds).
Test Suite 'Room_ComparisonUtilsTests' passed at 2017-05-26 00:15:07.752.
	 Executed 3 tests, with 0 failures (0 unexpected) in 0.005 (0.006) seconds

Test Suite 'CoreDataHotelTests.xctest' passed at 2017-05-26 00:15:07.753.
	 Executed 12 tests, with 0 failures (0 unexpected) in 0.032 (0.036) seconds

Test Suite 'All tests' passed at 2017-05-26 00:15:07.753.
	 Executed 12 tests, with 0 failures (0 unexpected) in 0.032 (0.037) seconds

```
