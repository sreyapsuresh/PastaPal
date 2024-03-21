//  ContentView.swift
//  PastaPal

import SwiftUI

struct ContentView: View {
    let recipes: [Recipe] = [
        Recipe(name: "Pasta Carbonara", ingredients: ["Spaghetti", "Eggs", "Bacon", "Parmesan Cheese"], quantities: [1, 2, 3, 1]),
        Recipe(name: "Chicken Alfredo", ingredients: ["Fettuccine", "Chicken Breast", "Heavy Cream", "Parmesan Cheese"], quantities: [1, 1, 1, 1]),
        Recipe(name: "Pasta Primavera", ingredients: ["Penne Pasta", "Cherry Tomatoes", "Olive Oil", "Parmesan Cheese"], quantities: [1, 2, 3, 1]),
        Recipe(name: "Pasta Aglio e Olio", ingredients: ["Spaghetti", "Garlic", "Olive Oil", "Red Pepper Flakes"], quantities: [1, 4, 3, 2]),
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(recipes, id: \.name) { recipe in
                    NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                        Text(recipe.name)
                    }
                }
            }
            .navigationTitle("PastaPal")
        }
    }
}

// This is a new view!!!
struct RecipeDetailView: View {
    @State private var multiplier = 1
    
    // Allows for Recipe's contents to be accessed here
    let recipe: Recipe
    
    var body: some View {
        VStack {
            List {
                ForEach(0..<recipe.ingredients.count, id: \.self) { index in
                    HStack {
                        Text(recipe.ingredients[index])
                        Spacer()
                        Text("\(recipe.quantities[index] * multiplier)x")
                    }
                }
            }
            
            HStack {
                Button("1x") { multiplier = 1 }
                Button("2x") { multiplier = 2 }
                Button("3x") { multiplier = 3 }
            }
            .padding()
        }
        .navigationTitle(recipe.name)
    }
}

#Preview {
    ContentView()
}

struct Recipe {
    let name: String
    let ingredients: [String]
    let quantities: [Int]
}
