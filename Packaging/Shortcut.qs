function Component() {
    // default constructor
}
Component.prototype.createOperations = function () {
    component.createOperations();
    if (systemInfo.productType === "windows") {
        // create shortcut in start menu
        component.addOperation("CreateShortcut", "@TargetDir@/bin/ApplicationName.exe",
            "@StartMenuDir@/ApplicationName.lnk", "workingDirectory=@TargetDir@",
            "iconPath=@TargetDir@/resources/Window.ico");

        // create shortcut on desktop 
        component.addOperation("CreateShortcut", "@TargetDir@/bin/ApplicationName.exe",
            "@DesktopDir@/ApplicationName.lnk", "workingDirectory=@TargetDir@",
            "iconPath=@TargetDir@/resources/Window.ico");

        // create maintenance tool shortcut
        component.addOperation("CreateShortcut", "@TargetDir@/ApplicationName Maintenance Tool.exe",
            "@StartMenuDir@/ApplicationName Maintenance Tool.lnk", "workingDirectory=@TargetDir@");
    }
}