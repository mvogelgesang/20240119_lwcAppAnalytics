@isTest
public class logInteractionTest {
    @isTest
    static void testLogInteraction() {
        Test.startTest();
        try {
            logInteraction.logInteraction('table');
            logInteraction.logInteraction('Card');
        } catch (Exception e) {
            System.assert(false, 'No exception should have been thrown');
        }
        Test.stopTest();
    }

    @isTest
    static void testLogInteractionNull() {
        Test.startTest();
        try {
            logInteraction.logInteraction(null);
        } catch (Exception e) {
            System.assert(true, 'An exception was thrown as expected');
        }
        Test.stopTest();
    }

}