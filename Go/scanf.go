package main

import (
	"fmt"
)

func main() {
	fmt.Println("프로그램을 가동합니다 ... ")
	var a uint
	fmt.Printf("숫자를 입력하세요 >> ")
	a = 1
	// fmt.Scanf("%d", &a)
	if a == 1 {
		fmt.Println("You Win!")
	} else {
		fmt.Println("you Lose..")
	}

}
