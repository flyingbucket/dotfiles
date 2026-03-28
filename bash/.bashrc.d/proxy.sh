proxy_on() {
  export http_proxy=http://127.0.0.1:7897
  export https_proxy=http://127.0.0.1:7897
  export all_proxy=socks5://127.0.0.1:7897
  echo useing clash-verge proxy
}

proxy_off() {
  unset http_proxy
  unset https_proxy
  unset all_proxy
  echo unset clash-verge proxy
}

proxy_check() {
  echo $http_proxy
  echo $https_proxy
  echo $all_proxy
}
