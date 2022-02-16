//
//  Home.swift
//  UI-466
//
//  Created by nyannyan0328 on 2022/02/16.
//

import SwiftUI

struct Home: View {
    @State var currentPuzzle : Puzzle = puzzles[0]
    @State var selectedLetter : [Letter] = []
    var body: some View {
        VStack{
            
            
            VStack{
                
                
                HStack{
                    
                
                    Button {
                        
                        selectedLetter.removeAll()
                        currentPuzzle = puzzles[0]
                        generators()
                        
                    } label: {
                        
                        Image(systemName: "arrowtriangle.left.square.fill")
                            .font(.system(size: 30, weight: .black))
                            .foregroundColor(.black)
                            
                    }
                    .lLeading()
                    
                    
                        Button {
                            
                        } label: {
                            
                            Image(systemName: "speaker.wave.2.fill")
                                .font(.system(size: 30, weight: .black))
                                .foregroundColor(.white)
                                .padding(15)
                                .background(Color("Blue"),in:Circle())
                                
                        }

                    
                }
                .overlay {
                    
                    Text("Level1")
                        .font(.title3.weight(.semibold))
                }
                
                Image(currentPuzzle.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: currentPuzzle.imageName == "p1" ? 20 : 0))
                    .padding(.vertical)
                
                
                HStack(spacing:10){
                    
                    ForEach(0..<currentPuzzle.answer.count,id:\.self){index in
                        
                        ZStack{
                            
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("Blue").opacity(selectedLetter.count > index ? 1 : 0.2))
                                .frame(height: 60)
                            
                            if selectedLetter.count > index{
                                
                                
                                Text(selectedLetter[index].value)
                                    .font(.title2.weight(.black))
                                    .foregroundColor(.white)
                            }
                            
                            
                        }
                        
                        
                    }
                    
                    
                    
                }
                
            }
            .padding()
            .background(.white,in: RoundedRectangle(cornerRadius: 10))
            
            
            
            HoneyComboGridView(items: currentPuzzle.lettere) { item in
                
                ZStack{
                    
                    HoneyComBoView()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color("Gold"))
                        .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                        .shadow(color: .red.opacity(0.1), radius: 5, x: 15, y: -5)
                      
                    
                                Text(item.value)
                                        .font(.largeTitle)
  
                }
                .contentShape(HoneyComBoView())
                .onTapGesture {
                    
                    
                    addLetter(letter: item)
                    
                }
                    
                
            }
            
            
            Button {
                
                
                selectedLetter.removeAll()
                currentPuzzle = puzzles[1]
                generators()
                
            } label: {
                
                Text("Next")
                    .font(.title2.weight(.semibold))
                    .foregroundColor(.black)
                    .lCenter()
                    .padding(.vertical,15)
                    .background(Color("Gold"),in: RoundedRectangle(cornerRadius: 10))
                    
            }
            .disabled(selectedLetter.count != currentPuzzle.answer.count)
            .opacity(selectedLetter.count != currentPuzzle.answer.count ? 0.6 : 1)

            
        }
        .padding()
        .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top)
        .background(Color("BG"))
        .onAppear {
            
            
            generators()
            
            
            
        }
    }
    func generators(){
        
        currentPuzzle.jumbbledWord.forEach { character in
            
            
            currentPuzzle.lettere.append(Letter(value: String(character)))
        }
    }
    
    func addLetter(letter : Letter){
        
        
        withAnimation{
            
            
            if isSelected(letter: letter){
                
                
                selectedLetter.removeAll { currentLetter in
                    
                    return currentLetter.id == letter.id
                    
                }
                
                
                
            }
            else{
                
                
                if selectedLetter.count == currentPuzzle.answer.count{return}
                
                selectedLetter.append(letter)
                
            
                
            }
            
        }
    }
    
    func isSelected(letter : Letter) -> Bool{
        
        
        return selectedLetter.contains { currentLetter in
            
            currentLetter.id == letter.id
        }
    }
    
    
    

}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


