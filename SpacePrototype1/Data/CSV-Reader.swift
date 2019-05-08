//
//  CSV-Reader.swift
//  SpacePrototype1
//
//  Created by Ethan Furstoss on 5/7/19.
//  Copyright © 2019 Madeline Placik. All rights reserved.
//

import Foundation


class CSV_Reader{
    
    static let csv_File_Name = "People-Counts"
    static func readInCountData() -> [String : [String:Int]]{
        var returnData = [String: [String : Int]]()
        let stringData = self.readDataFromCSV(fileName: self.csv_File_Name, fileType: "csv")
        let rowData = self.csv(data: stringData!)
        for cafeIndex in 1..<rowData[0].count{
            let cafeName = rowData[0][cafeIndex]
            returnData[cafeName] = [:]
            for row in 1..<rowData.count{
                returnData[cafeName]?[rowData[row][0]] = Int(rowData[row][cafeIndex])
            }
        }
        
        return returnData
        
    }
    private static func readDataFromCSV(fileName:String, fileType: String)-> String!{
        guard let filepath = Bundle.main.path(forResource: fileName, ofType: fileType)
            else {
                return nil
        }
        do {
            var contents = try String(contentsOfFile: filepath, encoding: .utf8)
            contents = cleanRows(file: contents)
            return contents
        } catch {
            print("File Read Error for file \(filepath)")
            return nil
        }
    }
    
    
    private static func cleanRows(file:String)->String{
        var cleanFile = file
        cleanFile = cleanFile.replacingOccurrences(of: "\r", with: "\n")
        cleanFile = cleanFile.replacingOccurrences(of: "\n\n", with: "\n")
        //        cleanFile = cleanFile.replacingOccurrences(of: ";;", with: "")
        //        cleanFile = cleanFile.replacingOccurrences(of: ";\n", with: "")
        return cleanFile
    }
    
    private static func csv(data: String) -> [[String]] {
        var result: [[String]] = []
        let rows = data.components(separatedBy: "\n")
        for row in rows {
            let columns = row.components(separatedBy: ",")
            result.append(columns)
        }
        return result
    }
}
