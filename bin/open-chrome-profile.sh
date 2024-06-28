#!/bin/bash

function open_chrome_profile() {
  echo "Opening Google Chrome with profile qwer"
  open -a Google Chrome
}
open -na 'Google Chrome' --args --profile-directory='Profile 1'  "https://mail.Google.com/"
