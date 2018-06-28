#!/usr/bin/osascript -l JavaScript
'use strict';

const app = Application("PlutoSeamless");
const seApp = Application('System Events');

/**
 * Get the list of URL patterns to be opened in remote session
 */
function getURLPatterns() {
  ObjC.import('Foundation');
  let env = $.NSProcessInfo.processInfo.environment; // -[[NSProcessInfo processInfo] environment]
  env = ObjC.unwrap(env);
  return ObjC.unwrap(env.REMOTE_URL_PATTERN);
}

/**
 * Returns true if the url has to be opened remotely
 */
function isRemoteURL(url) {
  const re = new RegExp(getURLPatterns() || 'xxxxx');
  return re.exec(url);
}

/**
 * Explicit run handler for the script
 * @param url URL that triggered the script run
 */
function run(url) {
  openURL(url);
  app.quit();
}

/**
 * Opens URLs in remote desktop conditionally
 * @param url URL to be opened
 */
function openURL(url) {
  if (isConnectedToVPN() && isRemoteURL(url)) {
    openURLRemotely(url);
  } else {
    // Open all in Chrome
    const chrome = Application('Google Chrome');
    const frontWindow = chrome.windows[0];
    const tab = new chrome.Tab({ url });
    frontWindow.tabs.push(tab);
    chrome.activate();
  }
}

/**
 * Opens URL in remote desktop
 * @param url URL to be opened
 */
function openURLRemotely(url) {
  const remoteDesktop = Application('Microsoft Remote Desktop');
  remoteDesktop.activate();
  delay(1);
  typeURL(url);
}

/**
 * Sends keystrokes for the URL
 * @param url URL to be typed
 */
function typeURL(url) {
  seApp.keystroke('r', { using: 'command down' });
  delay(1);
  seApp.keystroke(url);
  delay(1);
  seApp.keyCode(36);
}

/**
 * Checks if connected to VPN
 */
function isConnectedToVPN() {
  return Application('Cisco AnyConnect Secure Mobility Client').running();
}
