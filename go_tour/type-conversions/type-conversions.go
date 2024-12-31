package main

import (
	"fmt"
	"math"
	"math/cmplx"
)

var (
	ToBe = false
	MaxInt uint64 = 1<<64-1
	z = cmplx.Sqrt(-5 + 12i)
)


func main() {
	x := 3
	y := 4
	f := math.Sqrt(float64(x*x + y*y))
	z := uint(f)
	fmt.Println(x, y, z)
}
