import SwiftUI

@main
struct PokemonApp: App {
    @StateObject private var pokemonManager = PokemonManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(pokemonManager)
        }
    }
}

struct ContentView: View {
    @EnvironmentObject var pokemonManager: PokemonManager
    
    var body: some View {
        if pokemonManager.currentPokemon == nil {
            StarterSelectionView()
        } else {
            MainView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PokemonManager())
    }
}
