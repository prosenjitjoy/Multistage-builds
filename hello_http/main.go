package main

import (
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		log.Printf("%s %s %s\n", r.RemoteAddr, r.Method, r.URL)
		w.Write([]byte("Hello World!"))
	})

	log.Println("Starting http server")
	log.Fatal(http.ListenAndServe(":8080", nil))
}
