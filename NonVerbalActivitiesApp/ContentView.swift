import SwiftUI

struct Activity: Identifiable {
    let id = UUID()
    let title: String
    let prompt: String
    let systemImage: String
    let color: Color
}

struct ContentView: View {
    private let activities: [Activity] = [
        Activity(
            title: "Ir al baño",
            prompt: "Necesito ir al baño",
            systemImage: "figure.wave",
            color: Color(red: 0.18, green: 0.52, blue: 0.96)
        ),
        Activity(
            title: "Tengo hambre",
            prompt: "Me gustaría comer",
            systemImage: "fork.knife",
            color: Color(red: 0.98, green: 0.59, blue: 0.25)
        ),
        Activity(
            title: "Quiero jugar",
            prompt: "Vamos a jugar",
            systemImage: "gamecontroller",
            color: Color(red: 0.44, green: 0.27, blue: 0.88)
        ),
        Activity(
            title: "Ver TV",
            prompt: "Puedo ver televisión",
            systemImage: "tv",
            color: Color(red: 0.20, green: 0.73, blue: 0.53)
        ),
        Activity(
            title: "Leer",
            prompt: "Quiero leer un libro",
            systemImage: "book.closed",
            color: Color(red: 0.95, green: 0.30, blue: 0.47)
        )
    ]

    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    colors: [Color(red: 0.95, green: 0.97, blue: 1.0), Color(red: 0.88, green: 0.93, blue: 1.0)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 24) {
                        HeaderView()

                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(activities) { activity in
                                ActivityCard(activity: activity)
                            }
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 32)
                }
            }
            .navigationTitle("Verbal Spectrum")
        }
    }
}

struct HeaderView: View {
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "message")
                .font(.system(size: 48))
                .foregroundColor(Color(red: 0.03, green: 0.31, blue: 0.52))
                .padding(20)
                .background(
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .fill(Color.white.opacity(0.9))
                        .shadow(color: Color.black.opacity(0.1), radius: 20, x: 0, y: 10)
                )

            Text("Actividades para niños no verbales")
                .font(.title2.bold())
                .foregroundColor(Color(red: 0.03, green: 0.31, blue: 0.52))
                .multilineTextAlignment(.center)

            Text("Toca una tarjeta para comunicar rápidamente tus necesidades o intereses.")
                .font(.body)
                .foregroundColor(Color(red: 0.29, green: 0.41, blue: 0.54))
                .multilineTextAlignment(.center)
        }
    }
}

struct ActivityCard: View {
    let activity: Activity

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(systemName: activity.systemImage)
                .font(.system(size: 36, weight: .semibold))
                .foregroundColor(.white)

            VStack(alignment: .leading, spacing: 4) {
                Text(activity.title)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(activity.prompt)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.9))
            }
            Spacer()

            Text("Tap para elegir")
                .font(.footnote.weight(.medium))
                .foregroundColor(.white.opacity(0.9))
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .background(Color.white.opacity(0.2))
                .clipShape(Capsule())
        }
        .padding(20)
        .frame(maxWidth: .infinity, minHeight: 160)
        .background(activity.color)
        .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
        .shadow(color: activity.color.opacity(0.3), radius: 12, x: 0, y: 8)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.sizeCategory, .extraLarge)
    }
}
