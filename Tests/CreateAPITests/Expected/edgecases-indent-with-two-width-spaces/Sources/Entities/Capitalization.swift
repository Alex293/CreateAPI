// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct Capitalization: Codable {
  public var smallCamel: String?
  public var capitalCamel: String?
  public var smallSnake: String?
  public var capitalSnake: String?
  public var sCAETHFlowPoints: String?
  /// Name of the pet
  public var attName: String?

  public init(smallCamel: String? = nil, capitalCamel: String? = nil, smallSnake: String? = nil, capitalSnake: String? = nil, sCAETHFlowPoints: String? = nil, attName: String? = nil) {
    self.smallCamel = smallCamel
    self.capitalCamel = capitalCamel
    self.smallSnake = smallSnake
    self.capitalSnake = capitalSnake
    self.sCAETHFlowPoints = sCAETHFlowPoints
    self.attName = attName
  }

  private enum CodingKeys: String, CodingKey {
    case smallCamel
    case capitalCamel = "CapitalCamel"
    case smallSnake = "small_Snake"
    case capitalSnake = "Capital_Snake"
    case sCAETHFlowPoints = "SCA_ETH_Flow_Points"
    case attName = "ATT_NAME"
  }
}