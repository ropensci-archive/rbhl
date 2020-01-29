library("vcr")
vcr::vcr_configure(
  dir = "../fixtures",
  filter_sensitive_data = list("<<bhl_key>>" = Sys.getenv('BHL_KEY'))
)
