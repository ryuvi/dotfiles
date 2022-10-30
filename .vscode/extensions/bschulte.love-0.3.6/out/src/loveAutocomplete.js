"use strict";
const vscode = require("vscode");
const luaApi_1 = require("./luaApi");
const extension_1 = require("./extension");
// We'll keep track of the last main love module that was referenced. This way on
// subsequent parts of the same line we can look things up faster since we know which
// module to look in
let lastModule = '';
function getSuggestions(line, currentWord) {
    var results = [];
    // We'll figure out which part of the method we're on currently so we can figure out which item to suggest
    // This means that if the current word is empty, we've gotten here after typing a '.'
    // We'll split the string on '.' and grab the second to (because the last will be the empty string) last entry in
    // the resulting array to be our target key
    // we're looking for in the API array
    if (currentWord == "") {
        // Check if we're declaring a love callback function
        if (line.includes("function love.")) {
            let callbacks = luaApi_1.api.callbacks;
            for (let i = 0; i < callbacks.length; i++) {
                let newItem = new vscode.CompletionItem(callbacks[i].name, vscode.CompletionItemKind.Function);
                newItem.detail = extension_1.EXT_TAG;
                newItem.documentation = callbacks[i].description;
                results.push(newItem);
            }
            return results;
        }
        let words = line.trim().split('.');
        let targetKey = words[words.length - 2];
        // If we're not doing a callback then get the various type of completion items we could have
        return getProperData(targetKey, line);
    }
    else {
        results = [];
        return results;
    }
}
exports.getSuggestions = getSuggestions;
function getProperData(lookingForKey, line) {
    let r = [];
    // List of modules in LOVE so we can reference this and see if we're looking at a module's members
    // This will hopefully make things faster to lookup
    let modules = ["audio", "event", "filesystem", "font", "graphics", "image", "joystick", "keyboard", "math",
        "mouse", "physics", "sound", "system", "thread", "timer", "touch", "video", "window"];
    // Check if we're looking for top level API info
    if (lookingForKey == "love") {
        r = r.concat(getModuleCompletionItems(luaApi_1.api.modules));
        r = r.concat(getFunctionCompletionItems(luaApi_1.api.functions));
        r = r.concat(getTypeCompletionItems(luaApi_1.api.types));
        return r;
    }
    // Check if we're looking at one of the main modules of LOVE
    if (modules.indexOf(lookingForKey) > -1 && line.includes("love." + lookingForKey)) {
        lastModule = lookingForKey;
        // Go through the modules and find which one we're looking for
        let m = getModuleData(lastModule);
        // Get the functions, types, and enums for this module
        r = r.concat(getFunctionCompletionItems(m.functions));
        r = r.concat(getTypeCompletionItems(m.types));
        r = r.concat(getEnumCompletionItems(m.enums));
    }
    else {
        // Run through the proper modules enums first and see if that's what we're looking for
        // First, get the proper module name
        let moduleName = line.trim().split('.')[1];
        // Check to see if the first character of the "module" is a capital letter. This will mean that we're
        // dealing with a type of love and not a module
        let m = [];
        if (moduleName[0] === moduleName[0].toUpperCase()) {
            // Get the type data first
            let typeData = getTypeData(luaApi_1.api.types, moduleName);
            return getFunctionCompletionItems(typeData.functions);
        }
        else {
            m = getModuleData(moduleName);
        }
        // Now we've got the module info that we're referencing
        // Loop through the module's enums to see if that's what we're looking for
        for (let i = 0; i < m.enums.length; i++) {
            let enumData = m.enums[i];
            if (enumData.name == lookingForKey) {
                return getEnumConstantCompletionTypes(enumData);
            }
        }
        // Loop through the types to see if that's what we're looking for
        for (let i = 0; i < m.types.length; i++) {
            let typeData = m.types[i];
            if (typeData.name == lookingForKey) {
                return getFunctionCompletionItems(typeData.functions);
            }
        }
    }
    return r;
}
// Find the target modules data
function getModuleData(moduleName) {
    for (let i = 0; i < luaApi_1.api.modules.length; i++) {
        if (luaApi_1.api.modules[i].name == lastModule) {
            return luaApi_1.api.modules[i];
        }
    }
    console.error("We couldn't find the module we were looking for! " + moduleName);
    return {};
}
exports.getModuleData = getModuleData;
// Get the target type data. Expects an array of types
function getTypeData(startObject, typeName) {
    for (let i = 0; i < startObject.length; i++) {
        if (startObject[i].name == typeName) {
            return startObject[i];
        }
    }
}
exports.getTypeData = getTypeData;
// This function parses out an array of modules and return an array of CompletionItems
function getModuleCompletionItems(modules) {
    let items = [];
    for (let i = 0; i < modules.length; i++) {
        let newItem = new vscode.CompletionItem(modules[i].name, vscode.CompletionItemKind.Module);
        newItem.detail = "(module) " + extension_1.EXT_TAG;
        newItem.documentation = modules[i].description;
        items.push(newItem);
    }
    return items;
}
// This function parses out an array of functions and returns an array of CompletionItems
function getFunctionCompletionItems(functions) {
    let items = [];
    // Check for no functions being available
    if (!functions) {
        return [];
    }
    for (let i = 0; i < functions.length; i++) {
        let newItem = new vscode.CompletionItem(functions[i].name, vscode.CompletionItemKind.Function);
        newItem.detail = "(function) " + extension_1.EXT_TAG;
        newItem.documentation = functions[i].description;
        items.push(newItem);
    }
    return items;
}
// This function parses out an array of types and returns an array of CompletionItems
function getTypeCompletionItems(types) {
    let items = [];
    // Check for no types being available
    if (!types) {
        return [];
    }
    for (let i = 0; i < types.length; i++) {
        let newItem = new vscode.CompletionItem(types[i].name, vscode.CompletionItemKind.Keyword);
        newItem.detail = "(type) " + extension_1.EXT_TAG;
        newItem.documentation = types[i].description;
        items.push(newItem);
    }
    return items;
}
// This function parses out an array of enums and returns an array of CompletionItems
function getEnumCompletionItems(enums) {
    let items = [];
    // Check for no enums being available
    if (!enums) {
        return [];
    }
    for (let i = 0; i < enums.length; i++) {
        let newItem = new vscode.CompletionItem(enums[i].name, vscode.CompletionItemKind.Enum);
        newItem.detail = "(enum) " + extension_1.EXT_TAG;
        newItem.documentation = enums[i].description;
        items.push(newItem);
    }
    return items;
}
// This function parses out an array of enums and returns an array of CompletionItems
function getEnumConstantCompletionTypes(enums) {
    let items = [];
    for (let i = 0; i < enums.constants.length; i++) {
        let newItem = new vscode.CompletionItem(enums.constants[i].name, vscode.CompletionItemKind.Enum);
        newItem.detail = "(const) " + extension_1.EXT_TAG;
        newItem.documentation = enums.constants[i].description;
        items.push(newItem);
    }
    return items;
}
//# sourceMappingURL=loveAutocomplete.js.map