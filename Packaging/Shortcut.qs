function Component() {
    // default constructor
}
Component.prototype.createOperations = function () {
    component.createOperations();
    if (systemInfo.productType === "windows") {
        // create shortcut in start menu
        component.addOperation("CreateShortcut", "@TargetDir@/bin/ValveWizard.exe",
            "@StartMenuDir@/ValveWizard.lnk", "workingDirectory=@TargetDir@",
            "iconPath=@TargetDir@/resources/Window.ico");

        // create shortcut on desktop 
        component.addOperation("CreateShortcut", "@TargetDir@/bin/ValveWizard.exe",
            "@DesktopDir@/ValveWizard.lnk", "workingDirectory=@TargetDir@",
            "iconPath=@TargetDir@/resources/Window.ico");

        // create maintenance tool shortcut
        component.addOperation("CreateShortcut", "@TargetDir@/ValveWizard Maintenance Tool.exe",
            "@StartMenuDir@/ValveWizard Maintenance Tool.lnk", "workingDirectory=@TargetDir@");
    }
}