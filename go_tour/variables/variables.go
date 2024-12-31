package main

import "fmt"

var c, python, java bool


func main() {
	i := 1
	c, python, java := false, false, "aa"
	fmt.Println(i, c, python, java)
}
