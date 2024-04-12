public class AccountTriggerHelper {

    public static void setAccountTypeProspect(List<Account> accounts) {

        // Set the account type to prospect
        for(Account acc : accounts) {
            if (acc.Type == null) {
                acc.Type = 'Prospect';
            }
        }
    }
    
    public static void setAccountMailAddrToBillAddr(List<Account> accounts) {

        // Copy the shipping address to the billing address.
        for(Account acc : accounts) {
            acc.BillingStreet = acc.ShippingStreet;
            acc.BillingCity = acc.ShippingCity;
            acc.BillingState = acc.ShippingState;
            acc.BillingPostalCode = acc.ShippingPostalCode;
            acc.BillingCountry = acc.ShippingCountry;
            acc.Rating = 'Hot';
        }
    }

    public static void createDefaultContactForAccount(List<Account> accounts) {

        // Create a contact for each account inserted
        List<Contact> contactsToInsert = new List<Contact>();
        for(Account acc : accounts) {
            Contact con = new Contact();
            con.AccountId = acc.Id;
            con.LastName = 'DefaultContact';
            con.Email = 'default@email.com';
            contactsToInsert.add(con);
        }
        if(!contactsToInsert.isEmpty()) {
            insert contactsToInsert;
        }
    }
}
