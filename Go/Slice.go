package main

import (
	"fmt"
)

var p = fmt.Println

func main() {
	f1 := []string{"apple", "banana", "tomato"}
	f2 := []string{"grape", "strawberry"}
	f3 := append(f1[:2], f2...)
	f4 := append(f1[:2], f2...)

	fmt.Println(f1)
	fmt.Println(f2)
	fmt.Println(f3)
	fmt.Println(f4)
}
