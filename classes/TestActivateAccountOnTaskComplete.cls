@isTest
private class TestActivateAccountOnTaskComplete {
    @isTest
    static void testActivateAccountOnTaskComplete() {
        // Create a test user with the CQ Account Admin permission set
        Profile profile = [SELECT Id FROM Profile WHERE Name = 'Standard User']; // Change 'Standard User' to the appropriate profile name
        User testUser = new User(
            Alias = 'testUfwu',
            Email = 'tesdsvhjdhtuser@example.com',
            EmailEncodingKey = 'UTF-8',
            LastName = 'Testinggest',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            ProfileId = profile.Id,
            TimeZoneSidKey = 'America/Los_Angeles',
            UserName = 'testyesytestuser@example.com'
        );
        insert testUser;
        
        // Create a test account with Active = false (unchecked)
        Account testAccount = new Account(
            Name = 'Test Account',
            Active__c = false
        );
        insert testAccount;
        
        // Create a test task associated with the test account
        Task testTask = new Task(
            Subject = 'Test Task',
            ActivityDate = System.Today().addDays(7),
            OwnerId = testUser.Id,
            Status = 'Not Started',
            WhatId = testAccount.Id
        );
        insert testTask;
        
        // Test that the trigger activates the account and transfers comments to the account description
        testTask.Status = 'Completed';
        testTask.Description = 'This is a test comment';
        update testTask;
        
        // Verify that the account is activated (Active = true)
        testAccount = [SELECT Id, Active__c, Description FROM Account WHERE Id = :testAccount.Id];
        System.assertEquals(true, testAccount.Active__c);
    }
}