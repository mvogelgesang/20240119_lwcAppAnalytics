public class LogContactListInteraction {
    public Enum ContactListLayouts { TABLE, CARD }
    
    @AuraEnabled
    public static void log(String type) {
        try {
           IsvPartners.AppAnalytics.logCustomInteraction(getInteractionLabel(type)); 
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    private static ContactListLayouts getInteractionLabel(String type) {
        if (type.toLowerCase() == 'table') {
            return ContactListLayouts.TABLE;
        } else if (type.toLowerCase() == 'card') {
            return ContactListLayouts.CARD;
        } 
        return null;
    }
}