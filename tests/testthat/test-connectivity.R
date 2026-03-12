test_that("Archipelago connectivity reaches 100% (nc=1)", {
  # raw_data is now automatically loaded by the package
  weights <- build_archipelago_weight(raw_data, k = 5)

  # The Beast Metric
  expect_equal(spdep::n.comp.nb(weights$neighbours)$nc, 1)
})
