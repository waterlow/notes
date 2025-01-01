package main

import "fmt"

type Vertex struct {
	Lat, Long float64
}

func main() {
	m := map[string]Vertex{
		"a": {1,2},
		"b": {1,2},
	}

	fmt.Println(m)
}

