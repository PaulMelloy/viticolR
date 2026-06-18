# --- Helper setup for mocking data.table environment ---
test_data <- data.table(
  T_h = c(5, 10, 15, 20, 15, 10, 5, 10, 15, 20),
  M_h = c(FALSE, TRUE, TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE, TRUE)
)

test_that("calc_GER correctly calculates germinated oospores based on T_h and M_h thresholds", {
  # Test Case 1: Optimal conditions (T >= 10, M_h=TRUE)
  mock_calc_1 <- data.table(T_h = 18, M_h = TRUE)
  expect_type(calc_GER(mock_calc_1$M_h, mock_calc_1$T_h), "double")
  expect_gt(calc_GER(mock_calc_1$M_h, mock_calc_1$T_h), 0.01)

  # Test Case 2: Dry conditions (M_h=FALSE) - Should yield near zero germination.
  mock_calc_2 <- data.table(T_h = 20, M_h = FALSE)
  expect_lte(calc_GER(mock_calc_2$M_h, mock_calc_2$T_h), 1e-6)

  # Test Case 3: Low temperature condition (T_h < 10) - Should yield low/zero result.
  mock_calc_3 <- data.table(T_h = 8, M_h = TRUE)
  expect_lt(calc_GER(mock_calc_3$M_h, mock_calc_3$T_h), 0.5)
})
