package main

import (
	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
	"net/http"
)

func main() {
	r := chi.NewRouter()
	r.Use(middleware.Logger)

	r.Get("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("You are on route: /\n"))
		w.Write([]byte("Route you can visit: /hi\n"))
	})

	r.Get("/hi", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("You are on route: /hi\n"))
		w.Write([]byte("Route you can visit: /\n"))
	})

	if err := http.ListenAndServe(":5000", r); err != nil {
		panic(err)
	}
}
