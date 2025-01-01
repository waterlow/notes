package main

import "fmt"

func main() {
	q := []int{2,3,5,7,11}
	fmt.Println(q)

	r := []bool{true, false, false, true}
	fmt.Println(r)

	s := []struct {
		i int
		b bool
	}{
		{2, true},
	}
	fmt.Println(s)

	a := {2,true}
}
