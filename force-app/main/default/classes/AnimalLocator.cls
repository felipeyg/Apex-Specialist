// Create an Apex class that calls a REST endpoint and write a test class.
// Create an Apex class that calls a REST endpoint to return the name of an animal, write unit tests that achieve 100% code coverage for the class using a mock response, and run your Apex tests.

// Prework: Be sure the Remote Sites from the first unit are set up.
// Create an Apex class:
// Name: AnimalLocator
// Method name: getAnimalNameById
// The method must accept an Integer and return a String.
// The method must call https://th-apex-http-callout.herokuapp.com/animals/<id>, replacing <id> with the ID passed into the method 
// The method returns the value of the name property (i.e., the animal name)
// Create a test class:
// Name: AnimalLocatorTest
// The test class uses a mock class called AnimalLocatorMock to mock the callout response
// Create unit tests:
// Unit tests must cover all lines of code included in the AnimalLocator class, resulting in 100% code coverage
// Run your test class at least once (via Run All tests the Developer Console) before attempting to verify this challenge

/**
 * The AnimalLocator class provides a method to retrieve the name of an animal by its ID.
 */

/**
 * The AnimalLocator class provides a method to retrieve the name of an animal by its ID.
 */
public class AnimalLocator{
    /**
     * Retrieves the name of an animal by its ID.
     * @param id The ID of the animal.
     * @return The name of the animal.
     */
    public static String getAnimalNameById(Integer id){
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + id);
        req.setMethod('GET');
        Map<String, Object> animal= new Map<String, Object>();
        HttpResponse res = http.send(req);
        if (res.getStatusCode() == 200) {
            Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
            animal = (Map<String, Object>) results.get('animal');
        }
        return (String)animal.get('name');
    }
}