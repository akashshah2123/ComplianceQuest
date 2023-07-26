public class CreateTaskHandler {
    public static void cTask(List<Account> accList){
        List<Task> newTasks = new List<Task>();
        if(!accList.isEmpty()){
            for(Account acc : accList){
                if (!acc.Active__c) { 
                    Task newTask = new Task();
                    newTask.Subject = 'Review Account - ' + acc.AccountNumber;
                    newTask.ActivityDate = System.Today().addDays(7);
                    newTask.OwnerId = acc.OwnerId;
                    newTask.Status = 'Not Started';
                    newTask.WhatId = acc.Id; 
                    newTasks.add(newTask);
                    
                }
                
            }
            insert newTasks;
        }
        
    }
}