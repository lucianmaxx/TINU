//
//  IconsManager.swift
//  TINU
//
//  Created by Pietro Caruso on 10/06/18.
//  Copyright © 2018 Pietro Caruso. All rights reserved.
//

import Cocoa

public final class IconsManager{
	
	static let shared = IconsManager()
	
	//warning icon used by the app
	public var warningIcon: NSImage!{
		get{
			return getIconFor(path: "/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/AlertCautionIcon.icns", name: "warning")
		}
	}
	
	//stop icon used by the app
	public var stopIcon: NSImage!{
		get{
			if let i = getIconFor(path: "/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/AlertStopIcon.icns", name: "warning"){
				return i
			}else{
				return NSImage(named: "uncheck")
			}
		}
	}
	
	//gets the overlay for usupported stuff
	public var unsupportedOverlay: NSImage!{
		get{
			return getIconFor(path: "/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/Unsupported.icns", name: "warning")
		}
	}
	
	public var infoIcon: NSImage!{
		get{
			return getIconFor(path: "/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/AlertNoteIcon.icns", name: "warning")
		}
	}
	
	public var copyIcon: NSImage!{
		get{
			return getIconFor(path: "/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/MultipleItemsIcon.icns", name: "warning")
		}
	}
	
	public var saveIcon: NSImage!{
		get{
			return getIconFor(path: "/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/GenericDocumentIcon.icns", name: "warning")
		}
	}
	
	
	//return the icon of thespecified installer app
	
	func getInstallerAppIcon(forApp app: String) ->NSImage{
		let iconp = app + "/Contents/Resources/InstallAssistant.icns"
		
		if FileManager.default.fileExists(atPath: iconp){
			if let i = NSImage(contentsOfFile: iconp){
				return i
			}
		}
		
		return NSWorkspace.shared().icon(forFile: app)
	}
	
	//gets an icon from a file, if the file do not exists, it uses an icon from the assets
	public func getIconFor(path: String, name: String) -> NSImage!{
		if FileManager.default.fileExists(atPath: path){
			return NSImage(contentsOfFile: path)
		}else{
			return NSImage(named: name)
		}
	}
	
	public func getIconFor(path: String, alternate: NSImage!) -> NSImage!{
		if FileManager.default.fileExists(atPath: path){
			return NSImage(contentsOfFile: path)
		}else{
			return alternate
		}
	}
	
}

