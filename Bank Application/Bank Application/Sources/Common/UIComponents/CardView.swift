import SwiftUI

struct CardView: View {
    let card: Card
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(card.title)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text(card.accountHolder)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Image(systemName: "qrcode.viewfinder")
                    .font(.title2)
                    .foregroundColor(.black)
            }
            
            Text(card.iban)
                .font(.system(.subheadline, design: .monospaced))
                .foregroundColor(.secondary)
            
            Text(card.formattedBalance)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.green)
            
            HStack {
                Text("verfügbar")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(card.formattedAvailableBalance)
                    .font(.subheadline)
                    .foregroundColor(.primary)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    CardView(card: Card(
        title: "GIRO",
        accountHolder: "Flo Privat",
        iban: "AT59 3400 0000 0133 6254",
        balance: 1728.97,
        availableBalance: 1928.97
    ))
    .padding()
    .background(Color.gray.opacity(0.1))
} 