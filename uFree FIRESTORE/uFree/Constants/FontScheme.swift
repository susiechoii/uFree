import Foundation
import SwiftUI

class FontScheme: NSObject {
    static func kMontserratExtraBold(size: CGFloat) -> Font {
        return Font.custom(FontConstant.kMontserratExtraBold, size: size)
    }

    static func kMontserratRomanRegular(size: CGFloat) -> Font {
        return Font.custom(FontConstant.kMontserratRomanRegular, size: size)
    }

    static func kInterBlack(size: CGFloat) -> Font {
        return Font.custom(FontConstant.kInterBlack, size: size)
    }

    static func kInterExtraBold(size: CGFloat) -> Font {
        return Font.custom(FontConstant.kInterExtraBold, size: size)
    }

    static func kInterMedium(size: CGFloat) -> Font {
        return Font.custom(FontConstant.kInterMedium, size: size)
    }

    static func kInterRegular(size: CGFloat) -> Font {
        return Font.custom(FontConstant.kInterRegular, size: size)
    }

    static func kInterBold(size: CGFloat) -> Font {
        return Font.custom(FontConstant.kInterBold, size: size)
    }

    static func kInterSemiBold(size: CGFloat) -> Font {
        return Font.custom(FontConstant.kInterSemiBold, size: size)
    }

    static func kInterExtraLight(size: CGFloat) -> Font {
        return Font.custom(FontConstant.kInterExtraLight, size: size)
    }

    static func kNotoSans(size: CGFloat) -> Font {
        return Font.custom(FontConstant.kNotoSans, size: size)
    }

    static func kNunitoRegular(size: CGFloat) -> Font {
        return Font.custom(FontConstant.kNunitoRegular, size: size)
    }

    static func kNunitoExtraBold(size: CGFloat) -> Font {
        return Font.custom(FontConstant.kNunitoExtraBold, size: size)
    }

    static func kNunitoSemiBold(size: CGFloat) -> Font {
        return Font.custom(FontConstant.kNunitoSemiBold, size: size)
    }

    static func kRobotoRomanRegular(size: CGFloat) -> Font {
        return Font.custom(FontConstant.kRobotoRomanRegular, size: size)
    }

    static func kRobotoRomanThin(size: CGFloat) -> Font {
        return Font.custom(FontConstant.kRobotoRomanThin, size: size)
    }

    static func kRobotoRomanSemiBold(size: CGFloat) -> Font {
        return Font.custom(FontConstant.kRobotoRomanSemiBold, size: size)
    }

    static func kRobotoBlack(size: CGFloat) -> Font {
        return Font.custom(FontConstant.kRobotoBlack, size: size)
    }

    static func kIBMPlexSans(size: CGFloat) -> Font {
        return Font.custom(FontConstant.kIBMPlexSans, size: size)
    }

    static func kRalewaySemiBold(size: CGFloat) -> Font {
        return Font.custom(FontConstant.kRalewaySemiBold, size: size)
    }

    static func kRalewayRegular(size: CGFloat) -> Font {
        return Font.custom(FontConstant.kRalewayRegular, size: size)
    }

    static func fontFromConstant(fontName: String, size: CGFloat) -> Font {
        var result = Font.system(size: size)

        switch fontName {
        case "kMontserratExtraBold":
            result = self.kMontserratExtraBold(size: size)
        case "kMontserratRomanRegular":
            result = self.kMontserratRomanRegular(size: size)
        case "kInterBlack":
            result = self.kInterBlack(size: size)
        case "kInterExtraBold":
            result = self.kInterExtraBold(size: size)
        case "kInterMedium":
            result = self.kInterMedium(size: size)
        case "kInterRegular":
            result = self.kInterRegular(size: size)
        case "kInterBold":
            result = self.kInterBold(size: size)
        case "kInterSemiBold":
            result = self.kInterSemiBold(size: size)
        case "kInterExtraLight":
            result = self.kInterExtraLight(size: size)
        case "kNotoSans":
            result = self.kNotoSans(size: size)
        case "kNunitoRegular":
            result = self.kNunitoRegular(size: size)
        case "kNunitoExtraBold":
            result = self.kNunitoExtraBold(size: size)
        case "kNunitoSemiBold":
            result = self.kNunitoSemiBold(size: size)
        case "kRobotoRomanRegular":
            result = self.kRobotoRomanRegular(size: size)
        case "kRobotoRomanThin":
            result = self.kRobotoRomanThin(size: size)
        case "kRobotoRomanSemiBold":
            result = self.kRobotoRomanSemiBold(size: size)
        case "kRobotoBlack":
            result = self.kRobotoBlack(size: size)
        case "kIBMPlexSans":
            result = self.kIBMPlexSans(size: size)
        case "kRalewaySemiBold":
            result = self.kRalewaySemiBold(size: size)
        case "kRalewayRegular":
            result = self.kRalewayRegular(size: size)
        default:
            result = self.kMontserratExtraBold(size: size)
        }
        return result
    }

    enum FontConstant {
        /**
         * Please Add this fonts Manually
         */
        static let kMontserratExtraBold: String = "Montserrat-ExtraBold"
        /**
         * Please Add this fonts Manually
         */
        static let kMontserratRomanRegular: String = "MontserratRoman-Regular"
        /**
         * Please Add this fonts Manually
         */
        static let kInterBlack: String = "Inter-Black"
        /**
         * Please Add this fonts Manually
         */
        static let kInterExtraBold: String = "Inter-ExtraBold"
        /**
         * Please Add this fonts Manually
         */
        static let kInterMedium: String = "Inter-Medium"
        /**
         * Please Add this fonts Manually
         */
        static let kInterRegular: String = "Inter-Regular"
        /**
         * Please Add this fonts Manually
         */
        static let kInterBold: String = "Inter-Bold"
        /**
         * Please Add this fonts Manually
         */
        static let kInterSemiBold: String = "Inter-SemiBold"
        /**
         * Please Add this fonts Manually
         */
        static let kInterExtraLight: String = "Inter-ExtraLight"
        /**
         * Please Add this fonts Manually
         */
        static let kNotoSans: String = "NotoSans"
        /**
         * Please Add this fonts Manually
         */
        static let kNunitoRegular: String = "Nunito-Regular"
        /**
         * Please Add this fonts Manually
         */
        static let kNunitoExtraBold: String = "Nunito-ExtraBold"
        /**
         * Please Add this fonts Manually
         */
        static let kNunitoSemiBold: String = "Nunito-SemiBold"
        /**
         * Please Add this fonts Manually
         */
        static let kRobotoRomanRegular: String = "RobotoRoman-Regular"
        /**
         * Please Add this fonts Manually
         */
        static let kRobotoRomanThin: String = "RobotoRoman-Thin"
        /**
         * Please Add this fonts Manually
         */
        static let kRobotoRomanSemiBold: String = "RobotoRoman-SemiBold"
        /**
         * Please Add this fonts Manually
         */
        static let kRobotoBlack: String = "Roboto-Black"
        /**
         * Please Add this fonts Manually
         */
        static let kIBMPlexSans: String = "IBMPlexSans"
        /**
         * Please Add this fonts Manually
         */
        static let kRalewaySemiBold: String = "Raleway-SemiBold"
        /**
         * Please Add this fonts Manually
         */
        static let kRalewayRegular: String = "Raleway-Regular"
    }
}
