/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an org are executed whenever Apex code is deployed
 * to a production org to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production org. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the org size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class ParkLocatorTest {
    
	testMethod static void testCallout(){
        // Create a mock response
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        
        // Test the country method
        String country = 'United States';
        String[] result = ParkLocator.country(country);        
        
        // Verify the results
        System.assertEquals(3, result.size(), 'Incorrect number of park names returned');
        System.assertEquals('Park1', result[0], 'Incorrect park name at index 0');
        System.assertEquals('Park2', result[1], 'Incorrect park name at index 1');
        System.assertEquals('Park3', result[2], 'Incorrect park name at index 2');
    }
}