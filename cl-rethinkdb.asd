(asdf:defsystem cl-rethinkdb
  :author "Andrew Danger Lyon <orthecreedence@gmail.com>"
  :license "MIT"
  :version "0.0.2"
  :description "A RethinkDB driver for Common Lisp"
  :depends-on (#:protobuf #:parenscript #:cl-async-future #:cl-async)
  :components
  ((:file "util")
   (:file "package" :depends-on ("util"))
   (:file "protocol" :depends-on ("package"))
   (:file "config" :depends-on ("package"))
   (:module reql
    :serial t
	:components
	((:file "package")
	 (:file "datum")
	 (:file "term")
	 (:file "javascript")
	 (:file "commands")
	 (:file "dsl"))
	:depends-on ("protocol" "config"))
   (:file "query" :depends-on (reql "protocol" "config"))
   (:file "connection" :depends-on (reql "query" "config"))))

