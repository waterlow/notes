package main

import "fmt"

func fibonacci() func() int {
	x, y := 1, 0
	return func() int {
		x, y = y, x + y
		return y
	}
}

func main() {
	f := fibonacci()
	for i := 0; i < 10; i++ {
		fmt.Println(f())
	}
}
