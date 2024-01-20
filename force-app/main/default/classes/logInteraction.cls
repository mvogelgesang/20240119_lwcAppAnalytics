public class logInteraction {
    public Enum ViewLayouts { TABLE, CARD }
    
    @AuraEnabled
    public static void logInteraction(String type) {
        try {
           IsvPartners.AppAnalytics.logCustomInteraction(getInteractionLabel(type)); 
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    private static ViewLayouts getInteractionLabel(String type) {
        if (type.toLowerCase() == 'table') {
            return ViewLayouts.TABLE;
        } else if (type.toLowerCase() == 'card') {
            return ViewLayouts.CARD;
        } 
        return null;
    }
}