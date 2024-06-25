import SwiftUI
import MultipeerConnectivity

struct ContentView: View {
    @StateObject private var viewModel = PokemonViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("所持金: \(viewModel.money)ゼニー")
                    .font(.largeTitle)
                
                List(viewModel.ownedPokemon, id: \.id) { pokemon in
                    HStack {
                        Text(pokemon.name)
                        Spacer()
                        Button("売却") {
                            viewModel.sellPokemon(pokemon: pokemon)
                        }
                        .foregroundColor(.red)
                    }
                }
                
                NavigationLink(destination: ShopView(viewModel: viewModel)) {
                    Text("ショップ")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: PeerView(viewModel: viewModel)) {
                    Text("ポケモン交換")
                        .font(.title)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: SettingsView(viewModel: viewModel)) {
                    Text("設定")
                        .font(.title)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .navigationBarTitle("ポケモンアプリ")
        }
    }
}
