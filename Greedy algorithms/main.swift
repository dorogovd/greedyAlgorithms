//
//  main.swift
//  Greedy algorithms
//
//  Created by Dmitrii Dorogov on 18.05.2023.
//

import Foundation

print("Hello, World!")

var statesNeeded = Set(["mt", "wa", "or", "id", "nv", "ut", "ca", "az"]) // список штатов (переданный массив преобразуется в множество)

var stations = [String: Set<String>]() // набор станций из которого будет выбираться покрытие: ключи - названия станций, значения - охват штатов (все знаения являются множествами)
stations["kone"] = Set(["id", "nv", "ut"])
stations["ktwo"] = Set(["wa", "id", "mt"])
stations["kthree"] = Set(["or", "nv", "ca"])
stations["kfour"] = Set(["nv", "ut"])
stations["kfive"] = Set(["ca", "az"])

var finalStations = Set<String>() // итоговый набор станций

while !statesNeeded.isEmpty {
    
    var bestStation = String() // станция которая обслуживает больше всего штатов
    var statesCovered = Set<String>() // набор штатов, которые не входят в текущее покрытие
    
    for station in stations {
        var covered = statesNeeded.intersection(station.value) // множествог штатов которые не входят в покрытие текущей станции (штаты кторые ваходят в оба набора)
        if covered.count > statesCovered.count { // проверяем покрывает ли эта станция больше штатов чем текущая станция bestStation
            bestStation = station.key // если условие выполняется то станция сохраняется в bestStation
            statesCovered = covered // обновляем statesCovered
        }
        statesNeeded = statesNeeded.subtracting(statesCovered) // обновляем statesNeeded (штаты которые уже входят в покрытие больше не нужны)
        
        if !bestStation.isEmpty { // избегаем добавления пустых станций в набор
            finalStations.insert(bestStation) // bestStation добавляется в итоговый список станций
        }
    }
}

print(finalStations)
