terraform {
  # Require Terraform version 0.15.x (recommended)
  required_version = "> 0.15.0"

  required_providers {
    site24x7 = {
      source = "site24x7/site24x7"

    }
  }
}

// Authentication API doc - https://www.site24x7.com/help/api/#authentication
provider "site24x7" {
  // (Required) The client ID will be looked up in the SITE24X7_OAUTH2_CLIENT_ID
  // environment variable if the attribute is empty or omitted.
  oauth2_client_id = "1000.WUKOBLFTLZ844LNLB8QA42V28LUWXI"

  // (Required) The client secret will be looked up in the SITE24X7_OAUTH2_CLIENT_SECRET
  // environment variable if the attribute is empty or omitted.
  oauth2_client_secret = "0d4bdea98cddc1ee94ebf866822dd2e82d202c44b9"

  // (Required) The refresh token will be looked up in the SITE24X7_OAUTH2_REFRESH_TOKEN
  // environment variable if the attribute is empty or omitted.
  oauth2_refresh_token = "1000.20803aeb3607165b02d13538b7b607b4.8b20c5985336fac650211778e2266014"

  // (Optional) The access token will be looked up in the SITE24X7_OAUTH2_ACCESS_TOKEN
  // environment variable if the attribute is empty or omitted. You need not configure oauth2_access_token
  // when oauth2_refresh_token is set.
  oauth2_access_token = "1000.7ef6ba4db40bf7a1981b320b2e937af5.dbacd663fc3ba9c66fbf582ab0de4f0c"

	// (Optional) oauth2_access_token expiry in seconds. Specify access_token_expiry when oauth2_access_token is configured.
  access_token_expiry = "3600"

  // (Optional) ZAAID of the customer under a MSP or BU
  # zaaid = "1234"

  // (Required) Specify the data center from which you have obtained your
  // OAuth client credentials and refresh token. It can be (US/EU/IN/AU/CN).
  data_center = "US"

  // (Optional) The minimum time to wait in seconds before retrying failed Site24x7 API requests.
  retry_min_wait = 1

  // (Optional) The maximum time to wait in seconds before retrying failed Site24x7 API
  // requests. This is the upper limit for the wait duration with exponential
  // backoff.
  retry_max_wait = 30

  // (Optional) Maximum number of Site24x7 API request retries to perform until giving up.
  max_retries = 4
}

// Website Monitor API doc: https://www.site24x7.com/help/api/#website
resource "site24x7_website_monitor" "website_monitor_daffairecomplex" {
  // (Required) Display name for the monitor
  display_name = "Website Monitor - Terraform"

  // (Required) Website address to monitor.
  website = "https://www.daffairecomplex.com/"

  // (Optional) Interval at which your website has to be monitored.
  // See https://www.site24x7.com/help/api/#check-interval for all supported values.
  check_frequency = "1"

  // (Optional) Name of the Location Profile that has to be associated with the monitor. 
  // Either specify location_profile_id or location_profile_name.
  // If location_profile_id and location_profile_name are omitted,
  // the first profile returned by the /api/location_profiles endpoint
  // (https://www.site24x7.com/help/api/#list-of-all-location-profiles) will be
  // used.
  location_profile_name = "North America"


  // (Optional) HTTP Method to be used for accessing the website. Default value is 'G'. 'G' denotes GET, 'P' denotes POST and 'H' denotes HEAD. PUT, PATCH and DELETE are not supported.
  http_method = "P"

  // (Optional) Provide content type for request params when http_method is 'P'. 'J' denotes JSON, 'T' denotes TEXT, 'X' denotes XML and 'F' denotes FORM
  request_content_type = "J"

  // (Optional) Provide the content to be passed in the request body while accessing the website.
  request_body = "{\"user_name\":\"nbamo@dealertire.com\"}"

  // (Optional) Map of custom HTTP headers to send.
  request_headers = {
    "Accept" = "application/json"
  }
  # tag_ids = [site24x7_tag.tag_us.id]
}
// Site24x7 Rest API Monitor API doc - https://www.site24x7.com/help/api/#rest-api
resource "site24x7_rest_api_monitor" "rest_api_monitor_basic" {
  // (Required) Display name for the monitor
  display_name = "REST API Monitor - Terraform"
  // (Required) Website address to monitor.
  website = "https://www.daffairecomplex.com/"
  // (Optional) Name of the Location Profile that has to be associated with the monitor. 
  // Either specify location_profile_id or location_profile_name.
  // If location_profile_id and location_profile_name are omitted,
  // the first profile returned by the /api/location_profiles endpoint
  // (https://www.site24x7.com/help/api/#list-of-all-location-profiles) will be
  // used.
  location_profile_name = "North America"
}


// Site24x7 Heartbeat Monitor API doc - https://www.site24x7.com/help/api/#heartbeat
resource "site24x7_heartbeat_monitor" "heartbeat_monitor_basic" {
  // (Required) Display name for the monitor
  display_name = "Heartbeat Monitor - Terraform"
  // (Required) Unique name to be used in the ping URL.
  name_in_ping_url = "status_check"
}
