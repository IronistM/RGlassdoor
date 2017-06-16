# 'Get authentication details for using the Glassdoor API
#'


#' Retrieve the Glassdoor API key
glassdoor_pat <- function() {
  pat <- Sys.getenv('GLASSDOOR_PAT')
  if (identical(pat, "")) {
    stop("Please set env var GLASSDOOR_PAT to your glassdoor personal access token, eg Sys.setenv(GLASSDOOR_PAT='YOUR_KEY')",
         call. = FALSE)
  }

  pat
}

#' Retrieve the Glassdoor API partner ID
glassdoor_pid <- function() {
  pid <- Sys.getenv('GLASSDOOR_PID')
  if (identical(pid, "")) {
    stop("Please set env var GLASSDOOR_PID to your glassdoor personal access token, eg. Sys.setenv(GLASSDOOR_PID='YOUR_PARTNER_ID')",
         call. = FALSE)
  }

  pid
}
