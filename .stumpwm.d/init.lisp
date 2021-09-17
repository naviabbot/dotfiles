(in-package :stumpwm)

(require :swank)
(swank-loader:init)
(swank:create-server :port 4004
                     :style swank:*communication-style*
                     :dont-close t)


(push "/home/jdcain/quicklisp/local-projects/stumpwm-weather/" asdf:*central-registry*)
(ql:quickload :stumpwm-weather)
(mapcar #'load-module '("disk"
                            "swm-gaps"
                            ))
(setf *mode-line-timeout* 1)
(setf stumpwm-weather:*open-weather-map-api-key* "c2b5025a9eab389939ec6a5be13f7452"
          stumpwm-weather:*units*                 "imperial"
          stumpwm-weather:*format-str*            "%H% %d %t°F"
          stumpwm-weather:*time-format-str*       "%H:%M:%S" ; strftime format
          stumpwm-weather:*location*              "68005,us" ; Offuit AFB, NE 68005 USA
          stumpwm-weather:*mode-line-formatter*   #\E
          )
(stumpwm-weather:on)
(add-hook stumpwm:*quit-hook* 'stumpwm-weather:off)
(setf *screen-mode-line-format*
          (list
           "[^B%n^b]"
           " ^>| " ;align right
           " %d |" ;date
           " %D |" ;disk
           " %E "
           ))

(grename "Code")
(gnew "Web")
(gnew "Chat")
(gnew "Scrot")
(gselect "1")

(set-prefix-key (kbd "C-d"))
(define-key *root-map* (kbd "c") "exec kitty")

(setq *mode-line-foreground-color* "#ebdef4")
(setq *mode-line-background-color* "#1b1334")
(set-fg-color "#ebdef4")
(set-bg-color "#1b1334")
(set-font "-bitstream-bitstream vera sans mono-medium-r-normal-*-12-*-*-*-m-*-*-9")
(setf *message-window-gravity* :bottom)
(setf *message-window-input-gravity* :bottom)
(setf *input-window-gravity* :bottom)

(setf swm-gaps:*head-gaps-size* 8)
(setf swm-gaps:*inner-gaps-size* 5)
(setf swm-gaps:*outer-gaps-size* 5)
(run-shell-command "~/.fehbg")

(run-shell-command "compton &")
