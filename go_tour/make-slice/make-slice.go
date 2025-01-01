package main

import "fmt"

func printSlice(x []int) {
	fmt.Printf("len=%d cap=%d %v\n", len(x), cap(x), x)
}

func main() {
	a := make([]int, 5)
	printSlice(a)

	b := make([]int, 0, 5)
	printSlice(b)

	c := b[:2]
	printSlice(c)

	d := c[2:5]
	printSlice(d)


}
