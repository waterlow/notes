package main

import "fmt"

const (
	Big = 1 << 10
	Small = Big >> 99
)


func needInt(x int) int { return x * 10 + 1 }
func needFloat(x float64) float64 { return x * 0.1 }

func main() {
	fmt.Println(Small)
	fmt.Println(needInt(Big))
	fmt.Println(needInt(Small))
	fmt.Println(needFloat(Big))
	fmt.Println(needFloat(Small))
}
