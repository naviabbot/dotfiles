(in-package :stumpwm)
(set-prefix-key (kbd "C-d"))
(define-key *root-map* (kbd "c") "exec kitty")
(define-key *root-map* (kbd "C-c") "exec kitty")
