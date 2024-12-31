package main

import (
	"fmt"
	"math"
)

func Sqrt(x float64) float64 {
	z := x
	tmp := 0.0

	for math.Abs(z - tmp) > 0.00000001 {
		tmp = z
		z -= (z * z - x) / (2 * z)
	}
	return z
}

func main() {
	fmt.Println(Sqrt(2))
	fmt.Println(Sqrt(3))
	fmt.Println(Sqrt(5))
	fmt.Println(Sqrt(10))
}
