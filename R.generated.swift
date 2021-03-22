//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 1 colors.
  struct color {
    /// Color `AccentColor`.
    static let accentColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "AccentColor")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accentColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accentColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func accentColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.accentColor.name)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.file` struct is generated, and contains static references to 11 files.
  struct file {
    /// Resource file `HomeData.json`.
    static let homeDataJson = Rswift.FileResource(bundle: R.hostingBundle, name: "HomeData", pathExtension: "json")
    /// Resource file `back@2x.png`.
    static let back2xPng = Rswift.FileResource(bundle: R.hostingBundle, name: "back@2x", pathExtension: "png")
    /// Resource file `back@3x.png`.
    static let back3xPng = Rswift.FileResource(bundle: R.hostingBundle, name: "back@3x", pathExtension: "png")
    /// Resource file `home_select@2x.png`.
    static let home_select2xPng = Rswift.FileResource(bundle: R.hostingBundle, name: "home_select@2x", pathExtension: "png")
    /// Resource file `home_select@3x.png`.
    static let home_select3xPng = Rswift.FileResource(bundle: R.hostingBundle, name: "home_select@3x", pathExtension: "png")
    /// Resource file `home_unSelect@2x.png`.
    static let home_unSelect2xPng = Rswift.FileResource(bundle: R.hostingBundle, name: "home_unSelect@2x", pathExtension: "png")
    /// Resource file `home_unSelect@3x.png`.
    static let home_unSelect3xPng = Rswift.FileResource(bundle: R.hostingBundle, name: "home_unSelect@3x", pathExtension: "png")
    /// Resource file `personCenter_select@2x.png`.
    static let personCenter_select2xPng = Rswift.FileResource(bundle: R.hostingBundle, name: "personCenter_select@2x", pathExtension: "png")
    /// Resource file `personCenter_select@3x.png`.
    static let personCenter_select3xPng = Rswift.FileResource(bundle: R.hostingBundle, name: "personCenter_select@3x", pathExtension: "png")
    /// Resource file `personCenter_unSelect@2x.png`.
    static let personCenter_unSelect2xPng = Rswift.FileResource(bundle: R.hostingBundle, name: "personCenter_unSelect@2x", pathExtension: "png")
    /// Resource file `personCenter_unSelect@3x.png`.
    static let personCenter_unSelect3xPng = Rswift.FileResource(bundle: R.hostingBundle, name: "personCenter_unSelect@3x", pathExtension: "png")

    /// `bundle.url(forResource: "HomeData", withExtension: "json")`
    static func homeDataJson(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.homeDataJson
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "back@2x", withExtension: "png")`
    static func back2xPng(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.back2xPng
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "back@3x", withExtension: "png")`
    static func back3xPng(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.back3xPng
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "home_select@2x", withExtension: "png")`
    static func home_select2xPng(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.home_select2xPng
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "home_select@3x", withExtension: "png")`
    static func home_select3xPng(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.home_select3xPng
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "home_unSelect@2x", withExtension: "png")`
    static func home_unSelect2xPng(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.home_unSelect2xPng
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "home_unSelect@3x", withExtension: "png")`
    static func home_unSelect3xPng(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.home_unSelect3xPng
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "personCenter_select@2x", withExtension: "png")`
    static func personCenter_select2xPng(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.personCenter_select2xPng
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "personCenter_select@3x", withExtension: "png")`
    static func personCenter_select3xPng(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.personCenter_select3xPng
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "personCenter_unSelect@2x", withExtension: "png")`
    static func personCenter_unSelect2xPng(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.personCenter_unSelect2xPng
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "personCenter_unSelect@3x", withExtension: "png")`
    static func personCenter_unSelect3xPng(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.personCenter_unSelect3xPng
      return fileResource.bundle.url(forResource: fileResource)
    }

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 5 images.
  struct image {
    /// Image `back`.
    static let back = Rswift.ImageResource(bundle: R.hostingBundle, name: "back")
    /// Image `home_select`.
    static let home_select = Rswift.ImageResource(bundle: R.hostingBundle, name: "home_select")
    /// Image `home_unSelect`.
    static let home_unSelect = Rswift.ImageResource(bundle: R.hostingBundle, name: "home_unSelect")
    /// Image `personCenter_select`.
    static let personCenter_select = Rswift.ImageResource(bundle: R.hostingBundle, name: "personCenter_select")
    /// Image `personCenter_unSelect`.
    static let personCenter_unSelect = Rswift.ImageResource(bundle: R.hostingBundle, name: "personCenter_unSelect")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "back", bundle: ..., traitCollection: ...)`
    static func back(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.back, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "home_select", bundle: ..., traitCollection: ...)`
    static func home_select(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.home_select, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "home_unSelect", bundle: ..., traitCollection: ...)`
    static func home_unSelect(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.home_unSelect, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "personCenter_select", bundle: ..., traitCollection: ...)`
    static func personCenter_select(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.personCenter_select, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "personCenter_unSelect", bundle: ..., traitCollection: ...)`
    static func personCenter_unSelect(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.personCenter_unSelect, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    struct uiApplicationSceneManifest {
      static let _key = "UIApplicationSceneManifest"
      static let uiApplicationSupportsMultipleScenes = false

      struct uiSceneConfigurations {
        static let _key = "UISceneConfigurations"

        struct uiWindowSceneSessionRoleApplication {
          struct defaultConfiguration {
            static let _key = "Default Configuration"
            static let uiSceneConfigurationName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneConfigurationName") ?? "Default Configuration"
            static let uiSceneDelegateClassName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate"
            static let uiSceneStoryboardFile = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneStoryboardFile") ?? "Main"

            fileprivate init() {}
          }

          fileprivate init() {}
        }

        fileprivate init() {}
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try main.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = YYTabBarController

      let bundle = R.hostingBundle
      let name = "Main"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
