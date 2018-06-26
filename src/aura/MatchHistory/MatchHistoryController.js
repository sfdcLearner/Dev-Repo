({
	doInit: function(component, event, helper) {
        // Load expenses from Salesforce
        var action = component.get("c.getTeamHistory");
        action.setCallback(
            // Here’s my number,
            // Call me maybe
        );
        $A.enqueueAction(action);
    },
})