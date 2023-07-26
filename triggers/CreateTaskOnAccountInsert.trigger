trigger CreateTaskOnAccountInsert on Account (after insert) {
    if(Trigger.isAfter && Trigger.isInsert){
        CreateTaskHandler.cTask(Trigger.new);
    }

}