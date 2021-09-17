(in-package :stumpwm)

(push "/home/user/.quicklisp/local-projects/stumpwm-weather/" asdf:*central-registry*)
(ql:quickload :stumpwm-weather)


(mapcar #'load-module '("cpu"
                        "disk"
                        "hostname"
                        "mem"
                        "net"
                        ))

(setf *screen-mode-line-format*
      (list
       "[^B%n^b]"
       " %B"
                                        ;" ^[^B^7*%h^]"
       " ^>| " ;align right
                                        ;"%f " ;cpu speed
                                        ;"%t " ;cpu temp
                                        ;" %M |" ;memory
                                        ;" %N |" ;memory
       " %d |" ;date
       " %D |" ;disk
       " %c |" ;cpu load
       " %l |" ;wireless
       ))

(setf *mode-line-timeout* 1)

(setf stumpwm-weather:*open-weather-map-api-key*
      "c2b5025a9eab389939ec6a5be13f7452"

      stumpwm-weather:*units*                 "imperial"
      stumpwm-weather:*format-str*            "%H% %d %t°C"
      stumpwm-weather:*time-format-str*       "%H:%M:%S" ; strftime format
      stumpwm-weather:*location*              "68005,us" ; Mountain View, CA 94043 USA
      stumpwm-weather:*mode-line-formatter*   #\E

      stumpwm:*screen-mode-line-format*       (append '("%E")
                                                      stumpwm:*screen-mode-line-format*))

(stumpwm-weather:on)
(add-hook stumpwm:*quit-hook* 'stumpwm-weather:off)
;; aesthetic
(setq *mode-line-foreground-color* "#ebdbb2")
(setq *mode-line-background-color* "#282828")
