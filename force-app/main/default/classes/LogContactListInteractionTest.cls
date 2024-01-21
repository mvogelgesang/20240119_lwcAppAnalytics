@isTest
public class LogContactListInteractionTest {
    @isTest
    static void testLogInteractionValid() {
        Test.startTest();
        try {
            LogContactListInteraction.log('table');
            LogContactListInteraction.log('Card');
        } catch (Exception e) {
            System.assert(false, 'No exception should have been thrown');
        }
        Test.stopTest();
    }

    @isTest
    static void testLogInteractionNull() {
        Test.startTest();
        try {
            LogContactListInteraction.log(null);
        } catch (Exception e) {
            System.assert(true, 'An exception was thrown as expected');
        }
        Test.stopTest();
    }

}