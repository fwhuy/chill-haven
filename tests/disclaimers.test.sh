#!/bin/sh
set -eu

assert_absent() {
  file=$1
  pattern=$2
  if rg -n -i --fixed-strings "$pattern" "$file" >/dev/null; then
    echo "Unexpected disclaimer text in $file: $pattern" >&2
    exit 1
  fi
}

assert_present() {
  file=$1
  pattern=$2
  rg -n -i --fixed-strings "$pattern" "$file" >/dev/null
}

assert_absent win.html "school business project"
assert_absent win.html "grand prizes shown on the wheel are illustrative"
assert_present win.html "id=\"terms\""
assert_present win.html "Terms and conditions"
assert_present win.html "Wheel segment size and position do not represent the odds of winning."
assert_absent win.html "including a zero probability"
assert_present win.html "id=\"ch-agree\""
assert_present win.html "I accept the <a href=\"#terms\""
assert_present win.html "terms and conditions</a>."
assert_present win.html "role=\"dialog\""
assert_present win.html "aria-modal=\"true\""
assert_present win.html "id=\"ch-result-close\""
assert_present win.html "Please accept the terms and conditions."
assert_absent win.html "id=\"ch-near\""
assert_absent win.html "That was one segment away"
assert_absent win.html "var neighbour"
assert_present win.html "id=\"ch-pointer\""
assert_present win.html "@keyframes ch-pointer-tick"
assert_present win.html "function trackPointerTicks"
assert_present win.html "trackPointerTicks(5600)"
assert_present win.html "var EDGE_MIN = 0.96;"
assert_present win.html "var EDGE_RANGE = 0.025;"
assert_present win.html "EDGE_MIN + Math.random() * EDGE_RANGE"
assert_absent community.html "student business concept and the partnership described here is a proposal"
assert_absent reviews.html "Sample content for the school project"
# The checkout collects a card number, expiry and CVC on a public URL, so it has
# to say on its face that nothing is charged. Do not turn this into assert_absent.
assert_present checkout.html "no payment is processed"
assert_present index.html "not a medical or emergency service"
assert_present support.html "not a medical or emergency service"
assert_present privacy.html "not a medical or emergency service"

echo "Disclaimer content checks passed."
