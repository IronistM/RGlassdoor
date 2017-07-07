
<!-- README.md is generated from README.Rmd. Please edit that file -->
RGlassdoor
==========

[![Build Status](https://travis-ci.org/IronistM/RGlassdoor.svg?branch=master)](https://travis-ci.org/IronistM/RGlassdoor) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/RGlassdoor)](https://cran.r-project.org/package=RGlassdoor)

Intro
-----

The Glassdoor API is a simple, lightweight REST API that responds to http requests with JSON (future support for XML is planned). Because it is a REST API, it is completely stateless. Requests are expected to be made in the form of a simple HTTP GET.

Unless otherwise noted, these APIs are available for public use with a free Glassdoor account and pending a short approval process. The APIs that are not provided publicly are available to our API partners. If you're interested in becoming an API partner, please contact us.

<table style="width:18%;">
<colgroup>
<col width="6%" />
<col width="5%" />
<col width="5%" />
</colgroup>
<thead>
<tr class="header">
<th align="right">Parameter</th>
<th>Explanation</th>
<th>Required?</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="right">v</td>
<td>The API version. The current version is 1 except for jobs, which is currently version 1.1</td>
<td>Yes</td>
</tr>
<tr class="even">
<td align="right">format</td>
<td>Either xml or json as you prefer</td>
<td>Yes</td>
</tr>
<tr class="odd">
<td align="right">t.p</td>
<td>Your partner id, as assigned by Glassdoor</td>
<td>Yes</td>
</tr>
<tr class="even">
<td align="right">t.k</td>
<td>Your partner key, as assigned by Glassdoor</td>
<td>Yes</td>
</tr>
<tr class="odd">
<td align="right">userip</td>
<td>The IP address of the end user to whom the API results will be shown</td>
<td>Yes</td>
</tr>
<tr class="even">
<td align="right">useragent</td>
<td>The User-Agent (browser) of the end user to whom the API results will be shown. Note that you can can obtain this from the &quot;User-Agent&quot; HTTP request header from the end-user</td>
<td>Yes</td>
</tr>
<tr class="odd">
<td align="right">callback</td>
<td>If json is the requested format, you may specify a jsonp callback here, allowing you to make cross-domain calls to the glassdoor API from your client-side javascript. See the JSONP wikipedia entry for more information on jsonp.</td>
<td>No</td>
</tr>
<tr class="even">
<td align="right">action</td>
<td>The particular API call that you would like to make - see jobs, reviews, salaries, etc. sub-sections for details</td>
<td>Yes</td>
</tr>
<tr class="odd">
<td align="right">other</td>
<td>Each API action will require different parameters - in the example above, an employerId is passed in order to retrieve reviews.</td>
<td>Varies</td>
</tr>
</tbody>
</table>

Response Codes
--------------

You can always count on a high level success flag which will be either true or false, and status which will typically indicate additional information. If the call is successful, there will be a 'response' block. Common statuses are:

`OK`: request succeeded `Access-Denied`: your partner id/key are not correct, or not specified. Check the t.p and t.k params in your request Call-specific errors: for example on employer retrieval, it can return Employer-Not-Found
