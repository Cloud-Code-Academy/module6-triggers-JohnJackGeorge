trigger AccountTrigger on Account (before insert, after insert) {
    
    if (Trigger.IsBefore && Trigger.IsInsert) {
        // Set the account type to prospect
        AccountTriggerHelper.setAccountTypeProspect(Trigger.new);
        
        // Copy the shipping address to the billing address.
        AccountTriggerHelper.setAccountMailAddrToBillAddr(Trigger.new);

    }
    
    if (Trigger.IsAfter && Trigger.IsInsert) {
        
        // Create a contact for each account inserted
        AccountTriggerHelper.createDefaultContactForAccount(Trigger.new);
        
    }
}
