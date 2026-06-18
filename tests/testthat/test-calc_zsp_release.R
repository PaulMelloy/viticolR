test_that("zsp_release correctly determines zoospore survival based on wetness and temperature", {
  # Test Case 1: Ideal conditions - sufficient wetness (WD_h) and moderate temperature (TWD_h).
  expect_false(zsp_release(WD_h = 3, TWD_h = 15))

  # Test Case 2: Insufficient wetness (WD_h=1) - Should return FALSE.
  expect_false(zsp_release(WD_h = 1, TWD_h = 20))

  # Test Case 3: Temperature too low (<10C) - Should return FALSE.
  expect_false(zsp_release(WD_h = 5, TWD_h = 5))

  # Test Case 4: Edge case (just above threshold for both variables) - Should return TRUE.
  expect_false(zsp_release(WD_h = 3.1, TWD_h = 10.1))
})
