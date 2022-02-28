//
//  main.swift
//  4l_ChernikovOleg.playground
//
//  Created by Олег Черников on 28.02.2022.
//

import Foundation

enum CarBrands{
    case Mitsubishi, Dodge, Toyota, Lada
}

enum EngineStates{
    case running, off
}

enum WindowsStates{
    case up, down
}

enum TrunkSpace: Int{
    case pickup = 10
    case truck = 15
    case cargo = 30
}

enum TrunkLoaded{
    case loaded, empty
}

enum Engines: Int{
    case v6 = 300
    case v8 = 400
    case v12 = 600
}

enum Tunes{
    case none, drift, stance, drag
}


class Car{
    let brand: CarBrands
    private var engine: EngineStates {
        willSet{
            if newValue == .running{
                print("Engine is running")
            }
            else{
                print("Engine is off")
            }
        }
    }
    private var windows: WindowsStates {
        willSet{
            if newValue == .up{
                print("Windows are up")
            }
            else{
                print("Windows are down")
            }
        }
    }
    
    init(brand: CarBrands, engine: EngineStates, windows: WindowsStates){
        self.brand = brand
        self.engine = engine
        self.windows = windows
    }
    
    func engineControl(_ control:EngineStates){
        self.engine = control
    }
    func windowsControl(_ control:WindowsStates){
        self.windows = control
    }
    func whatAreYou(){
        print("My brand is \(self.brand)")
        print("My engine is \(self.engine)")
        print("My windows are \(self.windows)")
    }
}

class TrunkCar:Car{
    private let trunkSpace: TrunkSpace
    private var trunkLoaded: TrunkLoaded
    
    init(brand: CarBrands, engine: EngineStates, windows: WindowsStates, trunkSpace: TrunkSpace) {
        self.trunkSpace = trunkSpace
        self.trunkLoaded = .empty
        super.init(brand: brand, engine: engine, windows: windows)
    }
    
    override func whatAreYou() {
        print("My trunk is \(self.trunkSpace.rawValue) litres and I'm \(self.trunkLoaded)")
        super.whatAreYou()
    }
    
    func loadUnload(_ load: TrunkLoaded){
        switch load {
        case .loaded:
            if(self.trunkLoaded == load){
                print("Trunk already \(load)")
            }
            else{
                self.trunkLoaded = load
            }
        case .empty:
            if(self.trunkLoaded == load){
                print("Trunk already \(load)")
            }
            else{
                self.trunkLoaded = load
            }
        }
    }
}

class SportCar:Car{
    private let hp: Engines
    private var modified: Tunes
    
    init(brand: CarBrands, engine: EngineStates, windows: WindowsStates, hp: Engines) {
        self.hp = hp
        self.modified = .none
        super.init(brand: brand, engine: engine, windows: windows)
    }
    
    override func whatAreYou() {
        print("Engine: \(self.hp), modified: \(self.modified)")
        super.whatAreYou()
    }
    
    func pimpMyRide(_ tune: Tunes){
        self.modified = tune
        switch tune {
        case .none:
            print("It's stock now")
        case .drift:
            print("Now it's going sideways")
        case .stance:
            print("It looks good, but useless")
        case .drag:
            print("Quarter mile here I go")
        }
    }
}

var mitsu = SportCar(brand: .Mitsubishi, engine: .off, windows: .up, hp: .v6)

mitsu.pimpMyRide(.drift)

mitsu.whatAreYou()

var lada = TrunkCar(brand: .Lada, engine: .off, windows: .up, trunkSpace: .pickup)

lada.loadUnload(.loaded)

lada.whatAreYou()
