(setq
  package-enable-at-startup nil
  straight-base-dir (file-name-directory load-file-name))

(defvar bootstrap-version)
(let ((bootstrap-file
      (expand-file-name "straight/repos/straight.el/bootstrap.el" straight-base-dir))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package
  '(org :type git :repo "https://git.savannah.gnu.org/git/emacs/org-mode.git"))
(straight-use-package
  '(htmlize :type git :host github :repo "hniksic/emacs-htmlize"))

(require 'ob-python)
(setq
  org-src-fontify-natively t
  org-export-async-init-file load-file-name)
