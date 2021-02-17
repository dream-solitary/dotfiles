#!/bin/bash
# get local weather report in xmobar using wttr.in

str=$(curl -s "wttr.in/wuhan?format=j1" | jq -r '(.current_condition[] |
  .temp_C,
  .FeelsLikeC,
  .humidity,
  .pressure,
  .winddir16Point,
  .windspeedKmph,
  (.weatherDesc[] | .value)),
  (.weather[0] | .mintempC, .maxtempC)'  | paste -sd\| -)

IFS=\| read t t_feel hu p w_dir w_speed desc min max < <(echo $str)

printf "<fn=1> </fn>%b(%b)<fn=1>糖 </fn>%b/%b<fn=1>糖   </fn>%b%%  <fn=1> </fn>%dhPa  <fn=1>煮 </fn>%b %bKmph  <fn=1> </fn> %b\n" "$t" "$t_feel" "$min" "$max" "$hu" "$p" "$w_dir" "$w_speed" "$desc"
unset str t t_feel hu p w_dir w_speed desc

