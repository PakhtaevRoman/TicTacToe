//
//  SettingGameView.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 30.03.2026.
//

import SwiftUI

//struct SettingGameView: View {
//    var body: some View {
//        ZStack {
//            Color("BackgroundMain")
//                .ignoresSafeArea()
//
//            ScrollView(showsIndicators: false) { // ← добавили ScrollView
//
//                VStack { // основной контейнер всего контента
//
//                    HStack {
//                        Button {
//                            print("button tapped")
//                        } label: {
//                            Image("Icon")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 30, height: 22)
//                        }
//
//                        Spacer() // горизонтальный Spacer внутри HStack ←
//                    }
//                    .padding(.top, 20) // Весь HStack опускается вниз.
//                    .padding(.leading, 21)
//
//
//                    VStack { // Используем один VStack для позиционирования
//
//                        VStack (spacing: 20) { //spacing: расстониие м/у внутренними элем.
//
//                            HStack {
//                                Text("Game Time")
//                                    .font(.system(size: 20, weight: .semibold))
//
//                                Spacer()
//
//                                Image("Push-Switch")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 47, height: 28)
//                            }
//                            .padding(.leading, 27) // Если нужен отступ именно внутри синего контейнера,
//                            // то padding должен быть до background
//                            .padding(.trailing, 20)
//                            .frame(height: 69)
//                            .background(Color("Light-blue"))
//                            .cornerRadius(30)
//
//
//                            VStack(spacing: 0) {
//
//                                Text("Duration")
//                                    .frame(height: 44)
//                                    .frame(maxWidth: .infinity, alignment: .leading) // растягивает контейнер
//                                    .padding(.leading, 20)   // отступ только тексту
//                                    .overlay( // overlay рисует линию снизу
//                                        Rectangle()
//                                            .fill(Color("Blue"))
//                                            .frame(height: 1),
//                                        alignment: .bottom   // alignment: .bottom — прикрепляет её к нижнему краю
//                                    )
//
//                                Text("30 min")
//                                    .frame(height: 44)
//                                    .frame(maxWidth: .infinity, alignment: .leading)
//                                    .padding(.leading, 20)
//
//                                ZStack(alignment: .leading) {
//                                    Color("Purple")   // фон на всю ширину
//
//                                    Text("60 min")
//                                        .padding(.leading, 20)
//                                }
//                                .frame(height: 44)
//                                .frame(maxWidth: .infinity)
//
//
//                                Text("120 min")
//                                    .frame(height: 44)
//                                    .frame(maxWidth: .infinity, alignment: .leading)
//                                    .padding(.leading, 20)
//                            }
//                            .frame(maxWidth: .infinity)
//                            .background(Color("Light-blue"))
//                            .cornerRadius(30)
//
//                        }
//                        .padding(20)
//                        .background(Color.white)
//                        .cornerRadius(30)
//                        .shadow(color: Color.black.opacity(0.15),
//                                radius: 10,
//                                x: 4,
//                                y: 4)
//                        .padding(.horizontal, 21)
//                        .padding(.top) // скорректировал было - .padding(.top, 118)
//
//
//                        // Контейнер с выбором скинов
//                        HStack(spacing: 20) {
//
//                            // ✅ Первый контейнер
//                            VStack(spacing: 20) {
//
//                                HStack(spacing: 5) { // Был просто spacing. По умолчанию SwiftUI ставит 8
//                                    Image("Xskin1")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(height: 54) // было .frame(width: 53, height: 54) - жеский размер
//
//                                    Image("Oskin1")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(height: 54) // Если экран станет меньше, Image могут упереться в края конт.
//                                }
//
//                                Button {
//                                    print("button tapped")
//                                } label: {
//                                    Text("Picked")
//                                        .frame(width: 112, height: 39)
//                                        .font(.system(size: 20, weight: .semibold))
//                                        .foregroundColor(Color.white)
//                                        .background(Color("Blue"))
//                                        .cornerRadius(30)
//                                }
//                            }
//                            .frame(width: 152, height: 150)
//                            .background(Color.white)
//                            .cornerRadius(30)
//
//
//                            // ✅ Второй контейнер
//                            VStack(spacing: 20) { // Это делает интерфейс предсказуемым.
//
//                                HStack(spacing: 5) {
//                                    Image("Xskin2")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(height: 54)
//
//                                    Image("Oskin2")
//                                        .resizable() // Эту картинку можно растягивать или сжимать
//                                        .scaledToFit() // Масштабировать так, чтобы Image полностью поместилась в контейнер и сохранить пропорции
//                                        .frame(height: 54)
//                                }
//
//                                Button {
//                                    print("button tapped")
//                                } label: {
//                                    Text("Choose")
//                                        .frame(width: 112, height: 39)
//                                        .font(.custom("SF Pro Display", size: 20).weight(.semibold))
//                                        .foregroundColor(Color("TitleBlack"))
//                                        .background(Color("ButtonLightBlue"))
//                                        .cornerRadius(30)
//                                }
//                            }
//                            .frame(width: 152, height: 150)
//                            .background(Color.white)
//                            .cornerRadius(30)
//
//
//                        }
//                        .frame(maxWidth: .infinity) // Стабильнее, контейнер точно растянется на ширину экрана.(Было без)
//                        .padding(.horizontal, 33) // отступы от краёв экрана
//                        .padding(.top, 20)
//                        //.padding(.bottom, 123)
//
//                        // Контейнер с выбором скинов
//                        HStack(spacing: 20) {
//                            //✅ Третий контейнер
//
//                            VStack(spacing: 20) {
//
//                                HStack(spacing: 5) {
//                                    Image("Xskin3")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(height: 54)
//                                    Image("Oskin3")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(height: 54)
//                                }
//                                Button {
//                                    print("button tapped")
//                                } label: {
//                                    Text("Choose")
//                                        .frame(width: 112, height: 39)
//                                        .font(.custom("SF Pro Display", size: 20).weight(.semibold))
//                                        .foregroundColor(Color("TitleBlack"))
//                                        .background(Color("ButtonLightBlue"))
//                                        .cornerRadius(30)
//                                }
//                            }
//                            .frame(width: 152, height: 150)
//                            .background(Color.white)
//                            .cornerRadius(30)
//
//                            //✅ Четвертый контейнер
//
//                            VStack(spacing: 20) {
//
//                                HStack(spacing: 5) {
//                                    Image("Vector-1")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(height: 54)
//                                    Image("Vector-2")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(height: 54)
//                                }
//                                Button {
//                                    print("button tapped")
//                                } label: {
//                                        Text("Choose")
//                                        .frame(width: 112, height: 39)
//                                        .font(.custom("SF Pro Display", size: 20).weight(.semibold))
//                                        .foregroundColor(Color("TitleBlack"))
//                                        .background(Color("ButtonLightBlue"))
//                                        .cornerRadius(30)
//                                }
//                            }
//                            .frame(width: 152, height: 150)
//                            .background(Color.white)
//                            .cornerRadius(30)
//                        }
//                        .frame(maxWidth: .infinity)
//                        .padding(.horizontal, 33)
//
//                        // Контейнер с выбором скинов
//
//                        HStack(spacing: 20) {
//                            //✅ Пятый контейнер
//
//                            VStack(spacing: 20) {
//
//                                HStack(spacing: 5) {
//                                    Image("Oskin4")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(height: 54)
//                                    Image("Xskin4")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(height: 54)
//                                }
//
//                                Button {
//                                    print("button tapped")
//                                } label: {
//                                    Text("Choose")
//                                        .frame(width: 112, height: 39)
//                                        .font(.custom("SF Pro Display", size: 20).weight(.semibold))
//                                        .foregroundColor(Color("TitleBlack"))
//                                        .background(Color("ButtonLightBlue"))
//                                        .cornerRadius(30)
//                                }
//                            }
//                            .frame(width: 152, height: 150)
//                            .background(Color.white)
//                            .cornerRadius(30)
//
//                            //✅ Шестой контейнер
//
//                            VStack(spacing: 20) {
//
//                                HStack(spacing: 1.39) {
//                                    Image("Oskin5")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(height: 54)
//                                    Image("Xskin5")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(height: 54)
//                                }
//                                .padding(.leading, 20)
//                                .padding(.trailing, 22.61)
//
//                                Button {
//                                    print("button tapped")
//                                } label: {
//                                    Text("Choose")
//                                        .frame(width: 112, height: 39)
//                                        .font(.custom("SF Pro Display", size: 20).weight(.semibold))
//                                        .foregroundColor(Color("TitleBlack"))
//                                        .background(Color("ButtonLightBlue"))
//                                        .cornerRadius(30)
//                                }
//
//                            }
//                            .frame(width: 152, height: 150)
//                            .background(Color.white)
//                            .cornerRadius(30)
//
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
// MARK: - Модель данных (один скин)
struct Skin: Identifiable {
    let id = UUID()          // уникальный идентификатор для ForEach
    let xImage: String       // картинка для X
    let oImage: String       // картинка для O
}

// MARK: - Переиспользуемая карточка скина
struct SkinCardView: View {
    
    let skin: Skin           // данные карточки
    let isSelected: Bool     // выбран ли этот скин
    let action: () -> Void   // действие при нажатии
    
    var body: some View {
        VStack(spacing: 20) {
            
            // Картинки X и O
            HStack(spacing: 5) {
                Image(skin.xImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 54)
                
                Image(skin.oImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 54)
            }
            
            // Кнопка выбора
            Button(action: action) {
                Text(isSelected ? "Picked" : "Choose") // меняем текст
                    .frame(width: 112, height: 39)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(isSelected ? .white : Color("TitleBlack"))
                    .background(isSelected ? Color("Blue") : Color("ButtonLightBlue"))
                    .cornerRadius(30)
            }
        }
        .frame(width: 152, height: 150)
        .background(Color.white)
        .cornerRadius(30)
    }
}

// MARK: - Основной экран
struct SettingGameView: View {
    
    // MARK: - Состояние
    
    @State private var selectedSkinIndex: Int? = nil // индекс выбранного скина
    
    // Массив всех скинов (теперь легко масштабировать)
    let skins: [Skin] = [
        Skin(xImage: "Xskin1", oImage: "Oskin1"),
        Skin(xImage: "Xskin2", oImage: "Oskin2"),
        Skin(xImage: "Xskin3", oImage: "Oskin3"),
        Skin(xImage: "Vector-1", oImage: "Vector-2"),
        Skin(xImage: "Oskin4", oImage: "Xskin4"),
        Skin(xImage: "Oskin5", oImage: "Xskin5")
    ]
    
    var body: some View {
        ZStack {
            // Фон
            Color("BackgroundMain")
                .ignoresSafeArea()
            
            // Скролл всего экрана
            ScrollView(showsIndicators: false) {
                
                VStack {
                    
                    header             // верхняя панель
                    settingsBlock      // блок настроек
                    skinsGrid          // сетка скинов
                    
                }
            }
        }
    }
}

// MARK: - UI части (разбивка для читаемости)
extension SettingGameView {
    
    // MARK: Header (верхняя кнопка)
    var header: some View {
        HStack {
            Button {
                print("back tapped") // действие кнопки
            } label: {
                Image("Icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 22)
            }
            
            Spacer() // прижимает кнопку влево
        }
        .padding(.top, 20)
        .padding(.leading, 21)
    }
    
    // MARK: Блок настроек
    var settingsBlock: some View {
        VStack(spacing: 20) {
            
            // Переключатель Game Time
            HStack {
                Text("Game Time")
                    .font(.system(size: 20, weight: .semibold))
                
                Spacer()
                
                Image("Push-Switch")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 47, height: 28)
            }
            .padding(.horizontal, 20)
            .frame(height: 69)
            .background(Color("Light-blue"))
            .cornerRadius(30)
            
            // Блок Duration
            VStack(spacing: 0) {
                
                Text("Duration")
                    .frame(height: 44)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                    .overlay(
                        Rectangle()
                            .fill(Color("Blue"))
                            .frame(height: 1),
                        alignment: .bottom
                    )
                
                Text("30 min")
                    .frame(height: 44)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                
                // Выбранный вариант (пример)
                ZStack(alignment: .leading) {
                    Color("Purple") // подсветка
                    
                    Text("60 min")
                        .padding(.leading, 20)
                }
                .frame(height: 44)
                
                Text("120 min")
                    .frame(height: 44)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
            }
            .background(Color("Light-blue"))
            .cornerRadius(30)
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(color: Color.black.opacity(0.15),
                radius: 10,
                x: 4,
                y: 4)
        .padding(.horizontal, 21)
        .padding(.top)
    }
    
    // MARK: Сетка скинов (главное улучшение)
    var skinsGrid: some View {
        
        // 2 колонки
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
        return LazyVGrid(columns: columns, spacing: 20) {
            
            // Перебираем массив скинов
            ForEach(Array(skins.enumerated()), id: \.element.id) { index, skin in
                
                SkinCardView(
                    skin: skin,
                    isSelected: selectedSkinIndex == index // проверяем выбран ли
                ) {
                    selectedSkinIndex = index // сохраняем выбор
                }
            }
        }
        .padding(.horizontal, 21)
        .padding(.top, 20)
    }
}
struct SettingGameView_Previews: PreviewProvider {
    static var previews: some View {
        SettingGameView()
    }
}
