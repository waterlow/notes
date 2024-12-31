package main

import "fmt"

const Pi = 3.14

func main() {
	const World = "world"
	fmt.Println("Hello", World)
	fmt.Println("Happy", Pi, "Day")

	const Pi = 3.1
	fmt.Println(Pi)
}
