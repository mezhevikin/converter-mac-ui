import Foundation

public func l(
    _ string: String,
    table: String? = nil,
    bundle: Bundle = .main
) -> String {
    NSLocalizedString(
        string,
        tableName: table,
        bundle: bundle,
        comment: ""
    )
}
