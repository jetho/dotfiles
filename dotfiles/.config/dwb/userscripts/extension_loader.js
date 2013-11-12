#!javascript

//<contenthandler___SCRIPT
extensions.load("contenthandler", {
//<contenthandler___CONFIG
  // The handler can either be a string or a function, if it is a string
  // %u will be replaced with the uri of the request, if the handler is a
  // function the first parameter of the function will be the uri and the
  // function must return the command to execute.
  
  // Handle requests based on filename extension
  extension : {
    // "torrent" : "xterm -e 'aria2 %u'", 
    //"pdf" : "xterm -e 'wget %u --directory-prefix=~/mypdfs'"
    "pdf" : "xterm -e 'wget -O ~/Downloads/Tmp.pdf %u && apvlv ~/Downloads/Tmp.pdf && rm ~/Downloads/Tmp.pdf'"
  },

  // Handle requests based on URI scheme
  uriScheme : {
      //ftp : function(uri) { 
      //    if (uri[uri.length-1] == "/") 
      //        return "xterm -e 'ncftp " + uri + "'"; 
      //    else 
      //        return "xterm -e 'ncftpget " + uri + "'"; 
      //}
  },

  // Handle requests based on MIME type
  mimeType : {
    // "application/pdf" : "xterm -e 'wget %u --directory-prefix=~/mypdfs'"
  }
//>contenthandler___CONFIG
});
//>contenthandler___SCRIPT
//<adblock_subscriptions___SCRIPT
extensions.load("adblock_subscriptions", {
//<adblock_subscriptions___CONFIG

// Shortcut to subscribe to a filterlist
scSubscribe : null, 
// Command to subscribe to a filterlist
cmdSubscribe : "adblock_subscribe", 

// Shortcut to unsubscribe from a filterlist
scUnsubscribe : null, 

// Command to unsubscribe from a filterlist
cmdUnsubscribe : "adblock_unsubscribe",

// Shortcut to update subscriptions and reload filter rules
// Note that dwb will also update all subscriptions on startup
scUpdate : null, 

// Command to update subscriptions and reload filter rules
// Note that dwb will also update all subscriptions on startup
cmdUpdate : "adblock_update", 

// Path to the filterlist directory, will be created if it doesn't exist. 
filterListDir : data.configDir + "/adblock_lists"
//>adblock_subscriptions___CONFIG
});
//>adblock_subscriptions___SCRIPT
//<autoquvi___SCRIPT
extensions.load("autoquvi", {
//<autoquvi___CONFIG
// The quvi command
quvi      : "quvi",  

// External player command
player    : "mplayer %u", 

// Whether to automatically play videos if quvi finds a playable
// video
autoPlay  : true, 

// Whether to choose the quality before quvi starts
chooseQuality : true,

// A shortcut that spawns quvi for the current website
shortcut  : "",

// A command that spawns quvi for the current website 
command  : "autoquvi", 

// 
// Whether to autospawn quvi only in the active tab
activeOnly : true 

//>autoquvi___CONFIG
});
//>autoquvi___SCRIPT
//<formfiller___SCRIPT
extensions.load("formfiller", {
//<formfiller___CONFIG
// shortcut that gets and saves formdata
scGetForm : "efg",

// shortcut that fills a form
scFillForm : "eff",

// path to the formdata file
formData : data.configDir + "/forms",

// whether to use a gpg-encrypted file
useGPG : false,

// your GPG key ID (leave empty to use a symmetric cipher)
GPGKeyID : "",

// whether to use a GPG agent (requires non-empty GPGKeyID to work)
GPGAgent : false,

// additional arguments passed to gpg2 when encrypting the formdata
GPGOptEncrypt : "",

// additional arguments passed to gpg2 when decrypting the formdata
GPGOptDecrypt : "",

// whether to save the password in memory when gpg is used
keepPassword : true,

// whether to save the whole formdata in memory when gpg is used
keepFormdata : false

//>formfiller___CONFIG
});
//>formfiller___SCRIPT
//<requestpolicy___SCRIPT
/*<requestpolicy___DISABLED
extensions.load("requestpolicy", {
//<requestpolicy___CONFIG
    // path to a whitelist 
    whiteList : data.configDir + "/" + data.profile + "/requestpolicy.json",

    // shortcut to block/allow requests
    shortcut : "erp",

    // shortcut to unblock requests from current site that are blocked on all
    // sites
    unblockCurrent : "erC",

    // shortcut to unblock requests that are blocked on all sites
    unblockAll : "erA",

    // reload current site after blocking / unblocking a request
    autoreload : false, 

    // notify about blocked requests
    notify : false

    //>requestpolicy___CONFIG
});
requestpolicy___DISABLED>*/
//>requestpolicy___SCRIPT

//<unique_tabs___SCRIPT
extensions.load("unique_tabs", {
//<unique_tabs___CONFIG
// Shortcut that removes duplicate tabs
shortcutRemoveDuplicates : null,

// Command that removes duplicate tabs
commandRemoveDuplicates : "ut_remove_duplicates",

// Autofocus a tab if an url is already opened, if the url would be loaded in a
// new tab the new tab is closed. 
// Setting this to true makes commandRemoveDuplicates and
// shortcutRemoveDuplicates obsolete because there will be no duplicates. 
autoFocus : true,

// Shortcut for toggling autofocus
shortcutToggleAutoFocus : null, 

// Command for toggling autofocus
commandToggleAutoFocus : "ut_toggle_autofocus", 

//>unique_tabs___CONFIG
});
//>unique_tabs___SCRIPT
//<simplyread___SCRIPT
extensions.load("simplyread", {
//<simplyread___CONFIG
// Shortcut to toggle simplyread
shortcut : "SR", 

// Command to toggle simplyread
command : "simplyread",

// Whether to use a stylesheet
nostyle : false, 

// Whether to show links
nolinks : false 

//>simplyread___CONFIG
});
//>simplyread___SCRIPT
//<downloadhandler___SCRIPT
/*<downloadhandler___DISABLED
extensions.load("downloadhandler", {
//<downloadhandler___CONFIG
   handler : [
     // Each handler must have 2 or 3 properties:
     //
     // command : command to execute, must contain %f which will be replaced with
     //           the filepath, this property is mandatory
     //
     // extension : a filename extension, optional
     //
     // mimeType  : a mimetype, optional
     //
     
     // { command : "xpdf %f", mimeType : "application/pdf" }
     // { command : "xdvi %f", extension : "dvi" }
     
   ]
//>downloadhandler___CONFIG
});
downloadhandler___DISABLED>*/
//>downloadhandler___SCRIPT
//<userscripts___SCRIPT
extensions.load("userscripts", {
//<userscripts___CONFIG
  // paths to userscripts, this extension will also load all scripts in 
  // $XDG_CONFIG_HOME/dwb/greasemonkey, it will also load all scripts in
  // $XDG_CONFIG_HOME/dwb/scripts but this is deprecated and will be
  // disabled in future versions.
  scripts : []
//>userscripts___CONFIG
});
//>userscripts___SCRIPT
