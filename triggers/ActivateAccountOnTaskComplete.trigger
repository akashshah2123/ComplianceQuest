trigger ActivateAccountOnTaskComplete on Task ( after update) {
    if(Trigger.isafter && Trigger.isupdate){
        TaskHandler.upAcc(Trigger.new);
    }

}