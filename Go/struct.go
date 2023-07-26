package main

import "fmt"

// struct 정의
type person struct {
	name string
	age  int
}

func main() {
	p := person{}
	p.name = "Lee"
	p.age = 10

	p2 := person{name: "Sean", age: 50}

	p3 := new(person)
	p3.name = "Lee"
	fmt.Println(p)
	fmt.Println(p2)
	fmt.Println(p3)
}
