compose_query <- function(elements) {
  if (length(elements) == 0)
    return("")

  if (!all(has_name(elements)))
    stop("All components of query must be named", call. = FALSE)

  stopifnot(is.list(elements))
  elements <- compact(elements)

  names <- curl::curl_escape(names(elements))

  encode <- function(x) {
    if (inherits(x, "AsIs")) return(x)
    curl::curl_escape(x)
  }
  values <- vapply(elements, encode, character(1))

  paste0(names, "=", values, collapse = "&")
}
