package main

import (
	"io"
	"net/http"
)

func indexHandler(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "text/html; charset=UTF-8")
	io.WriteString(w, "Hello World!")
}

func main() {
	http.HandleFunc("/", indexHandler)
	http.ListenAndServe(":80", nil)
}
