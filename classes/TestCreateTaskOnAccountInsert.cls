@isTest
private class TestCreateTaskOnAccountInsert {
    @isTest
    static void testCreateTaskOnAccountInsert() {
        Profile profile = [SELECT Id FROM Profile WHERE Name = 'Standard User']; 
        User testUser = new User(
            Alias = 'testUtests',
            Email = 'testussdywdyfer@example.com',
            EmailEncodingKey = 'UTF-8',
            LastName = 'Testing',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            ProfileId = profile.Id,
            TimeZoneSidKey = 'America/Los_Angeles',
            UserName = 'testusertesttest@example.com'
        );
        insert testUser;
        
 
        
        Account testAccount2 = new Account(
            Name = 'Test Account 2',
            Active__c = false
        );
        insert testAccount2;
        
        Test.startTest();
        List<Task> tasks = [SELECT Id FROM Task WHERE WhatId = :testAccount2.Id];
        System.assertEquals(1, tasks.size());
        Test.stopTest();
    }
}