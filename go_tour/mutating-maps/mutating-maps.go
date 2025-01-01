package main

import "fmt"

func main() {
	m := map[string]int{}

	m["a"] = 42
	fmt.Println(m["a"])

	m["a"] = 48
	fmt.Println(m["a"])

	delete(m, "a")
	v, ok := m["a"]
	fmt.Println(v, ok)
}
