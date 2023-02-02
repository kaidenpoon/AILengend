//
//  Home.swift
//  AILegend
//
//  Created by Kaiden Poon on 2/2/2023.
//

import SwiftUI

struct Home: View {
    let fullScreen = UIScreen.main.bounds.size
    let singleImgWidth = (UIScreen.main.bounds.size.width - 32 - 30) / 4
    let gutter = 10
    let imgArr = ["img1","img2","img3","img4","img5","img6","img7","img8","img9","img10","img11","img12","img13","img14","img15","img16","img17","img18","img19","img20"]
    
    @State var isDone:Bool = false
    @State var isSearch:Bool = false
    @State var text:String = ""
    
    var body: some View {
        ZStack(alignment:.bottom) {
            VStack{
                //MARK: logo view
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:111)
                
                Spacer()
                
                if isSearch{
                    // generating status
                    if isDone{
                        Image("img10")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: fullScreen.width-16, height: fullScreen.width-16)
                            .cornerRadius(8)
                            .shadow(color: .black.opacity(0.3), radius: 3, x: 3, y: 3)
                        
                    }
                    
                    if !isDone{
                        ZStack {
                            Rectangle()
                                .fill(.white)
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: fullScreen.width)
                                .cornerRadius(8)
                                .shadow(color: .black.opacity(0.3), radius: 3, x: 3, y: 3)
                            
                            VStack(spacing:8) {
                                Image(systemName: "text.below.photo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 44)
                                    .foregroundColor(Color("Placeholder"))
                                
                                Text("Generating...")
                                    .font(.subheadline)
                                    .foregroundColor(Color("Placeholder"))
                            }
                            
                        }
                    }
                }else{
                    // if non-generating status
                    //MARK: gallery view and image view
                    HStack(spacing:10) {
                        // left gallery
                        VStack(spacing:10){
                            Group {
                                // top
                                Image(returnStr())
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: (singleImgWidth * 2) + 10,height: singleImgWidth )
                                
                                // middle
                                HStack {
                                    Group {
                                        Image(returnStr())
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                        
                                        Image(returnStr())
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                    }
                                    .cornerRadius(8)
                                }
                                
                                // bottom
                                Image(returnStr())
                            }
                            .cornerRadius(8)
                            
                        }
                        .shadow(color: .black.opacity(0.3), radius: 3, x: 3, y: 3)
                        
                        // right gallery
                        VStack(spacing:10){
                            Group {
                                // top
                                HStack {
                                    Group {
                                        Image(returnStr())
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                        
                                        Image(returnStr())
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                    }
                                    .cornerRadius(8)
                                }
                                
                                // middle
                                Image(returnStr())
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                
                                Image(returnStr())
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: (singleImgWidth * 2) + 10,height: singleImgWidth )
                            }
                            .cornerRadius(8)
                            
                        }
                        .shadow(color: .black.opacity(0.3), radius: 3, x: 3, y: 3)
                    }
                }
                
                if isDone{
                    HStack(spacing: 40) {
                        Button {
                            
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(Color("Viva"))
                        }
                        .frame(width: 44, height: 44)
                        .background(.white)
                        .clipShape(Circle())
                        .shadow(color: .black.opacity(0.3), radius: 3, x: 0, y: 3)
                        
                        Button{
                            
                        } label: {
                            Image(systemName: "square.and.arrow.down")
                                .foregroundColor(.white)
                        }
                        .frame(width: 44, height: 44)
                        .background(Color("Viva"))
                        .clipShape(Circle())
                        .shadow(color: .black.opacity(0.3), radius: 3, x: 0, y: 3)

                    }
                    .padding(.top,24)
                }
                
                Spacer()
                
                //MARK: searach bar
                HStack(spacing: 16) {
                    if isSearch{
                        ZStack(alignment: .leading) {
                            Capsule()
                                .fill(.white)
                                .frame(height:44)
                                .frame(maxWidth:.infinity)
                                .shadow(color: .black.opacity(0.3), radius: 3, x: 3, y: 3)
                            
                            
                            
                            TextField(text: $text) {
                                Text("Generat image from your word...")
                            }
                            .frame(maxWidth:.infinity)
                            .padding(.horizontal,16)
                        }
                        
                        
                    }
                    
                    
                    Button {
                        withAnimation {
                            isSearch.toggle()
                            
                            text = ""
                        }
                    } label: {
                        Image(systemName: isSearch ? "paperplane.fill":"magnifyingglass")
                    }
                    .frame(width: 44,height: 44)
                    .background(Color("Viva"))
                    .cornerRadius(22)
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.3), radius: 3, x: 3, y: 3)
                    
                }
                
            }
            .padding(.horizontal,16)
            .padding(.top,56)
            .padding(.bottom, 64)
            
            //MARK: admob
            Rectangle()
                .frame(height: 50)
        }
        .ignoresSafeArea()
        
    }
    
    func returnStr() -> String{
        imgArr.randomElement() ?? "img"
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
