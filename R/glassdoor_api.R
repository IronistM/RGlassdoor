glassdoor_api <-
  function(action = NULL,
           other = NULL,
           q = NULL,
           version = 1,
           format = 'json') {
    v <- 1
    userip <- '0.0.0.0'
    # ipify::get_ip()[1]
    t.p <- Sys.getenv('GLASSDOOR_PID')
    t.k <- Sys.getenv('GLASSDOOR_PAT')
    format <- 'json'
    action <- 'employer'
    ua <-
      encodeString(
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.39 Safari/537.36'
      )

    # Compose the URL query
    url <-
      httr::modify_url(
        "http://api.glassdoor.com/api/api.htm",
        query = list(
          v = '1',
          format = format,
          t.p = t.p,
          t.k = t.k,
          userip = '0.0.0.0',
          useragent = 'Mozilla/5.0'
        )
      )

    resp <- httr::GET(url)
    if (httr::http_type(resp) != "application/json") {
      stop("API did not return json", call. = FALSE)
    }

    parsed <-
      jsonlite::fromJSON(httr::content(resp, "text"), simplifyVector = FALSE)

    if (httr::http_error(resp)) {
      stop(
        sprintf(
          "Glassdoor API request failed [%s]\n%s\n<%s>",
          httr::status_code(resp),
          parsed$message,
          parsed$documentation_url
        ),
        call. = FALSE
      )
    }

    structure(list(
      content = parsed,
      path = path,
      response = resp
    ),
    class = "glassdoor_api")
  }
