public class TaskHandler {
    public static void upAcc(List<Task> tsList){
        Set<Id> accountIdsToUpdate = new Set<Id>();
        
        for (Task task : tsList) {
            if (task.Status == 'Completed' && task.owner.CQ_Account_Admin) {
                accountIdsToUpdate.add(task.WhatId);
                
                Account acc = new Account(Id = task.WhatId);
                acc.Description = task.Description;
            }
        }
        
        if (!accountIdsToUpdate.isEmpty()) {
            List<Account> accountsToUpdate = [SELECT Id FROM Account WHERE Id IN :accountIdsToUpdate];
            for (Account acc : accountsToUpdate) {
                acc.Active__c = true;
            }
            update accountsToUpdate;
        }
    }
    
}