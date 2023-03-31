package main

import "fmt"

var (
	firstName, lastName, s string
	// i                      int
	// f                      float32
	// input                  = "56.12 / 5212 / Go"
	// format                 = "%f / %d / %s"
)

func main() {
	fmt.Println("Please enter your full name: ")
	fmt.Scanln(&firstName, &lastName) // 读取用户输入

	fmt.Printf("Hi %s %s!\n", firstName, lastName) // 打印

}
