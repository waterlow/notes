package main

import "fmt"

var c, python, java bool


func main() {
	var i = 1
	var c, python, java = false, false, "aa"
	fmt.Println(i, c, python, java)
}
