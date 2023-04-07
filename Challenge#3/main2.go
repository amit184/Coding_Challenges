package main

import (
	"fmt"
	"encoding/json"
)


 func main() {
	birdJson := `{"birds":{"pigeon":"likes to perch on rocks","eagle":{"type":"bi"}},"animals":"none"}`
	var result map[string]any
	json.Unmarshal([]byte(birdJson), &result)
    
	// The object stored in the "birds" key is also stored as
	// a map[string]any type, and its type is asserted from
	// the `any` type
	birds := result["birds"].(map[string]any)
    fmt.Println(birds)
	// for key, value := range birds {
	// 	// Each value is an `any` type, that is type asserted as a string
	// 	fmt.Println(key, value.(string))
	// }
	//pigeon likes to perch on rocks
	//eagle bird of prey
}
