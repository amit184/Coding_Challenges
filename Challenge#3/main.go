package main

import (
	"fmt"
	"encoding/json"
)

type Info struct {
	Name string
	Age int
}

func main() {
	amit_Info := `{"name":"Amit","Age":30}`
	var details Info
	json.Unmarshal([]byte(amit_Info), &details)
	fmt.Printf("Amit's Name : %d", details.Age)
}

