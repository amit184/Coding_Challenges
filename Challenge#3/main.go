package main

import (
	"encoding/json"
	"fmt"
)


func main() {
	amit_Info := `{"birds":{"pigeon":"likes to perch on rocks","eagle":"bird of prey"},"animals":"none"}`
	getData(amit_Info, "animals")
}


 func getData(object string, keyString string) {
	var details map[string]any
	json.Unmarshal([]byte(object), &details)
	// fmt.Println(details)
	result := details[keyString].(map[string]any)
	// fmt.Println(result)
	for key, value := range result {
		// Each value is an `any` type, that is type asserted as a string
		fmt.Printf("%s : %s\n", key, value.(string))
	}
 }
