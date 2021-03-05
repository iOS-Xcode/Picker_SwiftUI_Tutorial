//
//  MyFilteredList.swift
//  Picker_SwiftUI_Tutorial
//
//  Created by Seokhyun Kim on 2021-03-05.
//

import SwiftUI
//CaseIterable enum을 랜덤으로
enum School : String, CaseIterable {
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
}
//List data and model
struct Myfriend : Identifiable, Hashable {
    var id = UUID() //고유값을 만듬
    var name : String
    var school : School
}

func prepareData() -> [Myfriend] {
    var newList = [Myfriend]()
    for i in 0...20 {
        //id 는 자동 적용.
        let newFriend = Myfriend(name: "My friend \(i)", school: School.allCases.randomElement()!) //enum 랜덤 접근.
        newList.append(newFriend)
    }
    return newList
}

struct MyFilteredList: View {
    @State private var filteredValue = School.elementary
    
    @State private var myFrientsList = [Myfriend]()
    //State 에 값을 넣기 위해서는 init
    init() {
        _myFrientsList = State(initialValue: prepareData())
    }
    
    var body: some View {
        VStack {
            Text("Selected filter : \(filteredValue.rawValue)")
            Picker(selection: $filteredValue, label: Text(""), content: {
                Text("elementary").tag(School.elementary)
                Text("middle").tag(School.middle)
                Text("high").tag(School.high)
            }).pickerStyle(SegmentedPickerStyle())
            
            List {
                ForEach(myFrientsList.filter{ filterTerm in
                    //$0.school == filteredValue
                    filterTerm.school == filteredValue
                }) { friendItem in
                    GeometryReader{
                        geometryProxy in
                        HStack {
                            Text("name: \(friendItem.name)")
                                .frame(width: geometryProxy.size.width / 2)
                            Divider()
                            Text("school: \(friendItem.school.rawValue)")
                                .frame(width: geometryProxy.size.width / 2)
                        }
                        
                    }
                }
            }
        }
        //            List {
        //                ForEach(myFrientsList, id: \.self) { friendItem in
        //                    GeometryReader{
        //                        geometryProxy in
        //                        HStack {
        //                            Text("name: \(friendItem.name)")
        //                                .frame(width: geometryProxy.size.width / 3)
        //                            Divider()
        //                            Text("school: \(friendItem.school.rawValue)")
        //                                .frame(width: geometryProxy.size.width / 2)
        //                        }
        //
        //                    }
        //                }
        //            }
    }
}


struct MyFilteredList_Previews: PreviewProvider {
    static var previews: some View {
        MyFilteredList()
    }
}
